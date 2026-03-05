class ProductModel {
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final double price;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.category
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      imageUrl: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": imageUrl,
    };
  }
}