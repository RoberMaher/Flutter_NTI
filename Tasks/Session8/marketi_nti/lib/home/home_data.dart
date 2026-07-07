// home/home_data.dart
import 'package:marketi_nti/home/widgets/brand_item.dart';
import 'package:marketi_nti/home/widgets/category_item.dart';

class HomeData {
  static List<String> offers = [
    "assets/images/Offer_1.png",
    "assets/images/Offer_1.png",
    "assets/images/Offer_1.png",
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
