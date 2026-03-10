import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ts_training_demo_ca/core/constant/string/custom_string.dart';
import 'package:ts_training_demo_ca/feature/cart/data/model/product_model.dart';

abstract class CartDataSource {
  Future<ProductModel> addProduct(String title,String category,String imageUrl,double price);
  Future<List<ProductModel>> getProduct();
  Future<void> removeProduct(String id);
}


class CartDataSourceImpl extends CartDataSource {
  @override
  Future<ProductModel> addProduct(
      String title,
      String category,
      String imageUrl,
      double price,
      ) async {

    final product = await FirebaseFirestore.instance
        .collection("cart")
        .add({
      "title": title,
      "category": category,
      "imageUrl": imageUrl,
      "price": price,
    });

    return ProductModel(
      id: product.id,
      title: title,
      category: category,
      imageUrl: imageUrl,
      price: price,
    );
  }


  @override
  Future<List<ProductModel>> getProduct() async {
    final product = await FirebaseFirestore.instance.collection("cart").get();

    return product.docs.map((doc) {
      return ProductModel(
        id: doc.id,
        title: doc["title"],
        category: doc["category"],
        imageUrl: doc["imageUrl"],
        price: doc["price"],
      );
    }).toList();
  }

  @override
  Future<void> removeProduct(String id)async {
    try{
      await FirebaseFirestore.instance.collection("cart").doc(id).delete();
    }catch(e){
      throw Exception(CustomString.somethingWentWrong + e.toString());
    }
  }
}