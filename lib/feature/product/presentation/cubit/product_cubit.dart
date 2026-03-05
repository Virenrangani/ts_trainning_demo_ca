import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_training_demo_ca/feature/product/domain/usecase/product_use_case.dart';
import 'package:ts_training_demo_ca/feature/product/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState>{
  final ProductUseCase productUseCase;
  ProductCubit(this.productUseCase):super(ProductInitial());

  Future<void> getProducts()async{
    emit(ProductLoading());
    try {
      final products=await productUseCase.productCall();
      emit(ProductSuccess(products));
    }catch(e){
      emit(ProductFailure(e.toString()));
    }
  }
}