import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_training_demo_ca/core/constant/string/custom_string.dart';
import 'package:ts_training_demo_ca/feature/cart/domain/usecase/cart_use_case.dart';
import 'package:ts_training_demo_ca/feature/cart/presentation/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState>{
  final CartUseCase cartUseCase;
  CartCubit(this.cartUseCase):super(CartInitial());

  Future<void> addProduct(
      String title,
      String category,
      double price,
      String imageUrl
      )async{
    emit(CartLoading());
    try{
      final product=await cartUseCase.callAddProduct(title, price, category, imageUrl);
      emit(CartAddProduct(product));
    }catch(e){
      emit(CartFailure(e.toString()));
    }
  }

  Future<void> getProduct()async{
    emit(CartLoading());
    try{
      final products=await cartUseCase.callGetProduct();
      emit(CartSuccess(products));
    }catch(e){
      emit(CartFailure(e.toString()));
    }
  }

  Future<void> removeItem(String id)async{

    emit(CartLoading());
    try{
      await cartUseCase.callRemoveItem(id);
      emit(CartRemoveItem());
      await getProduct();
    }catch(e){
      emit(CartFailure(e.toString()));
    }
  }
}