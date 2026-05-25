class ProductModel {
  final String image;
  final String name;
  final double price;
  final double rate;
  bool isFav;
  bool isStar;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    this.isFav = false,
    this.isStar = false,
  });
}