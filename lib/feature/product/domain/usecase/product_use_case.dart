
import 'package:ts_training_demo_ca/feature/product/domain/entity/product_entity.dart';

import '../repository/product_repository.dart';

class ProductUseCase {
  final ProductRepository productRepository;
  ProductUseCase(this.productRepository);

  Future<List<ProductEntity>> productCall()async{
    return await productRepository.getProducts();
  }
}