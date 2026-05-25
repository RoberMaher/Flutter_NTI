import 'package:marketi_nti/home/widgets/brand_item.dart';
import 'package:marketi_nti/home/widgets/category_item.dart';
import 'package:marketi_nti/home/widgets/product_model.dart';

class HomeData {
  static List<String> offers = [
    "assets/images/Offer_1.png",
    "assets/images/Offer_1.png",
    "assets/images/Offer_1.png",
  ];

  static List<ProductModel> products = [
    ProductModel(
      image: "assets/images/Smart_Watch.png",
      name: "Smart Watch",
      price: 499,
      rate: 4.9,
    ),
    ProductModel(
      image: "assets/images/iPhone_11_Pro.png",
      name: "iPhone 11 Pro",
      price: 1999,
      rate: 4.7,
    ),
    ProductModel(
      image: "assets/images/Camera.png",
      name: "Canon 5D Camera",
      price: 4999,
      rate: 4.9,
    ),
    ProductModel(
      image: "assets/images/iPhone_11_Pro.png",
      name: "iPhone 11 Pro",
      price: 1999,
      rate: 4.7,
    ),
  ];

  static List<CategoryItem> categories = [
    CategoryItem(
      title: "Pampers",
      image: "assets/images/Pampers_Seventh_Generation.png",
    ),
    CategoryItem(
      title: "Pampers",
      image: "assets/images/Pampers_Seventh_Generation.png",
    ),
    CategoryItem(
      title: "Pampers",
      image: "assets/images/Pampers_Seventh_Generation.png",
    ),
    CategoryItem(
      title: "Pampers",
      image: "assets/images/Pampers_Seventh_Generation.png",
    ),
    CategoryItem(
      title: "Pampers",
      image: "assets/images/Pampers_Seventh_Generation.png",
    ),
    CategoryItem(
      title: "Pampers",
      image: "assets/images/Pampers_Seventh_Generation.png",
    ),
  ];

  static List<BrandItem> brands = [
    BrandItem(image: "assets/icons/JBL_Logo.png"),
    BrandItem(image: "assets/icons/Twon_Team_Logo.png"),
    BrandItem(image: "assets/icons/Sony_Logo.png"),
    BrandItem(image: "assets/icons/Sony_Logo.png"),
  ];
}
