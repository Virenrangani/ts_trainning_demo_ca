import 'dart:convert';
import 'package:ts_training_demo_ca/feature/product/data/product_model/product_model.dart';
import 'package:dio/dio.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductDataSourceImpl extends ProductDataSource{
  final Dio dio=Dio();

  @override
  Future<List<ProductModel>> getProducts()async{
    final response=await dio.get("https://fakestoreapi.com/products");

    if(response.statusCode==200){
      final List data=response.data;

      return data.map((e)=>ProductModel.fromJson(e)).toList();
    }else{
      throw Exception("Something went to wrong");
    }
  }

}