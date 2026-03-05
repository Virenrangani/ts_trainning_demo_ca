import 'package:ts_training_demo_ca/feature/product/domain/entity/product_entity.dart';

abstract class ProductState {}

class ProductInitial extends ProductState{}

class ProductLoading extends ProductState{}

class ProductSuccess extends ProductState{
  final List<ProductEntity> products;
  ProductSuccess(this.products);
}

class ProductFailure extends ProductState{
  final String message;
  ProductFailure(this.message);
}