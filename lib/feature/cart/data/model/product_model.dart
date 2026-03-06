class ProductModel {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final double price;

  ProductModel({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json, String id) {
    return ProductModel(
      id: id,
      title: json["title"] ?? "",
      category: json["category"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      price: (json["price"] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "category": category,
      "imageUrl": imageUrl,
      "price": price,
    };
  }
}