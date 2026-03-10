import 'dart:convert';
import 'package:ts_training_demo_ca/core/constant/string/custom_string.dart';
import 'package:ts_training_demo_ca/core/network/api_url/api_base_url.dart';
import 'package:ts_training_demo_ca/core/network/api_url/api_end_points.dart';
import 'package:ts_training_demo_ca/feature/product/data/product_model/product_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/dio/api_dio.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductDataSourceImpl extends ProductDataSource{

  @override
  Future<List<ProductModel>> getProducts()async{
    await Future.delayed(Duration(seconds: 3));
    final response=await ApiDio.dio.get(ApiBaseUrl.fakeStoreApi+ApiEndPoints.fakeApiProduct);

    if(response.statusCode==200){
      final List data=response.data;

      return data.map((e)=>ProductModel.fromJson(e)).toList();
    }else{
      throw Exception(CustomString.somethingWentWrong);
    }
  }

}