import 'package:ts_training_demo_ca/feature/product/data/data_source/product_data_source.dart';
import 'package:ts_training_demo_ca/feature/product/domain/entity/product_entity.dart';
import 'package:ts_training_demo_ca/feature/product/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository{
  final ProductDataSource productDataSource;

  ProductRepositoryImpl(this.productDataSource);

  @override
  Future<List<ProductEntity>> getProducts()async {
    final models=await productDataSource.getProducts();

    return models.map(
            (model)=>ProductEntity(
                image: model.imageUrl,
                id: model.id, price:
                model.price,
                category: model.category,
                description: model.description,
                title: model.title))
        .toList();
  }
}