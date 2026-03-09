import 'package:ts_training_demo_ca/feature/cart/domain/entity/product_entity.dart';

abstract class CartRepository {
  Future<ProductEntity> addProduct(String title,double price,String category,String imageUrl);
  Future<List<ProductEntity>> getProduct();
  Future<void> removeProduct(String id);
}