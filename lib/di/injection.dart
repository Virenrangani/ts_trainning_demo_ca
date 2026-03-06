import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:ts_training_demo_ca/feature/auth/data/data_source/login_data_source.dart';
import 'package:ts_training_demo_ca/feature/auth/data/data_source/sign_up_data_source.dart';
import 'package:ts_training_demo_ca/feature/auth/data/repository/login_repository_impl.dart';
import 'package:ts_training_demo_ca/feature/auth/data/repository/sign_up_repository_impl.dart';
import 'package:ts_training_demo_ca/feature/auth/domain/repository/login_repository.dart';
import 'package:ts_training_demo_ca/feature/auth/domain/repository/sign_up_repository.dart';
import 'package:ts_training_demo_ca/feature/auth/domain/usecase/login_use_case.dart';
import 'package:ts_training_demo_ca/feature/auth/domain/usecase/sign_up_use_case.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:ts_training_demo_ca/feature/cart/data/data_source/cart_data_source.dart';
import 'package:ts_training_demo_ca/feature/cart/data/repository/cart_repository_impl.dart';
import 'package:ts_training_demo_ca/feature/cart/domain/repository/cart_repository.dart';
import 'package:ts_training_demo_ca/feature/cart/domain/usecase/cart_use_case.dart';
import 'package:ts_training_demo_ca/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:ts_training_demo_ca/feature/product/data/data_source/product_data_source.dart';
import 'package:ts_training_demo_ca/feature/product/data/repository/product_repository_impl.dart';
import 'package:ts_training_demo_ca/feature/product/domain/repository/product_repository.dart';
import 'package:ts_training_demo_ca/feature/product/domain/usecase/product_use_case.dart';
import 'package:ts_training_demo_ca/feature/product/presentation/cubit/product_cubit.dart';

class Injection {

  final GetIt sl = GetIt.instance;

  void configDependencies() {
    sl.registerLazySingleton(() => FirebaseAuth.instance);

    sl.registerLazySingleton<LoginDataSource>(()=> LoginDataSourceImpl(sl()));

    sl.registerLazySingleton<LoginRepository>(()=> LoginRepositoryImpl(sl()));

    sl.registerLazySingleton<LoginUseCase>(()=> LoginUseCase(sl()));

    sl.registerFactory(()=>LoginCubit(sl()));

    sl.registerLazySingleton<SignUpDataSource>(()=>SignUpDataSourceImpl(sl()));

    sl.registerLazySingleton<SignUpRepository>(()=> SignUpRepositoryImpl(sl()));

    sl.registerLazySingleton<SignUpUseCase>(()=> SignUpUseCase(sl()));

    sl.registerFactory(()=>SignUpCubit(sl()));

    sl.registerLazySingleton<ProductDataSource>(()=>ProductDataSourceImpl());
    sl.registerLazySingleton<ProductRepository>(()=>ProductRepositoryImpl(sl()));
    sl.registerLazySingleton<ProductUseCase>(()=>ProductUseCase(sl()));
    sl.registerFactory<ProductCubit>(()=>ProductCubit(sl()));

    sl.registerLazySingleton<CartDataSource>(()=>CartDataSourceImpl());
    sl.registerLazySingleton<CartRepository>(()=>CartRepositoryImpl(sl()));
    sl.registerLazySingleton<CartUseCase>(()=>CartUseCase(sl()));
    sl.registerFactory<CartCubit>(()=>CartCubit(sl()));
  }
}