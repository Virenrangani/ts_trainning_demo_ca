
class ProductEntity {
  final String image;
  final int id;
  final double price;
  final String category;
  final String title;
  final String? description;

  ProductEntity({
    required this.image,
    required this.id,
    required this.price,
    required this.category,
    required this.title,
    this.description
});
}