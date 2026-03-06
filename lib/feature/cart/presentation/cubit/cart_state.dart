import 'package:ts_training_demo_ca/feature/cart/domain/entity/product_entity.dart';

abstract class CartState {}

class CartInitial extends CartState{}

class CartLoading extends CartState{}

class CartAddProduct extends CartState{
  final ProductEntity product;
  CartAddProduct(this.product);
}

class CartSuccess extends CartState{
  final List<ProductEntity> product;
  CartSuccess(this.product);
}

class CartFailure extends CartState{
  final String message;
  CartFailure(this.message);
}


