import 'package:ts_training_demo_ca/feature/product/domain/entity/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
}