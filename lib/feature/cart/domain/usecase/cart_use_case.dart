import 'package:ts_training_demo_ca/feature/cart/domain/entity/product_entity.dart';
import 'package:ts_training_demo_ca/feature/cart/domain/repository/cart_repository.dart';

class CartUseCase {
  final CartRepository cartRepository;
  CartUseCase(this.cartRepository);

  Future<ProductEntity> callAddProduct(String title,double price,String category,String imageUrl)async{
    return await cartRepository.addProduct(title, price, category, imageUrl);
  }

  Future<List<ProductEntity>> callGetProduct()async{
    return await cartRepository.getProduct();
  }

  Future<void> callRemoveItem(String id)async{
    await cartRepository.removeProduct(id);
  }
}