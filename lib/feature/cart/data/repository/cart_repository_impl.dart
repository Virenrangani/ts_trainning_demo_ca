import 'package:ts_training_demo_ca/feature/cart/data/data_source/cart_data_source.dart';
import 'package:ts_training_demo_ca/feature/cart/domain/entity/product_entity.dart';
import 'package:ts_training_demo_ca/feature/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl extends CartRepository{
  final CartDataSource cartDataSource;
  CartRepositoryImpl(this.cartDataSource);
  
  @override
  Future<ProductEntity> addProduct(
      String title,
      double price,
      String category,
      String imageUrl) async{

    final product=await cartDataSource.addProduct(title, category, imageUrl, price);
    
    return ProductEntity(
        image: product.imageUrl,
        id: product.id,
        price: product.price,
        category: product.category,
        title: product.title
    );
  }

  @override
  Future<List<ProductEntity>> getProduct() async {
    final products = await cartDataSource.getProduct();

    return products.map((product) => ProductEntity(
      id: product.id,
      title: product.title,
      category: product.category,
      image: product.imageUrl,
      price: product.price,
    )).toList();
  }

  @override
  Future<void> removeProduct(String id) async {
     await cartDataSource.removeProduct(id);
  }
}