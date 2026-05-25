import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/home/widgets/brand_item.dart';
import 'package:marketi_nti/home/widgets/category_item.dart';
import 'package:marketi_nti/home/widgets/product_model.dart';
import 'package:marketi_nti/home/widgets/scrolled_offers.dart';
import 'package:marketi_nti/home/widgets/scrolled_products.dart';
import 'package:marketi_nti/home/widgets/search_bar.dart';
import 'package:marketi_nti/home/widgets/section_title.dart';

class HomeView extends StatefulWidget {
  final List<String> items = [
    "assets/images/Offer_1.png",
    "assets/images/Offer_1.png",
    "assets/images/Offer_1.png",
  ];

  final List<ProductModel> products = [
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

  final List<CategoryItem> categories = [
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

  final List<BrandItem> brands = [
    BrandItem(image: "assets/icons/JBL_Logo.png"),
    BrandItem(image: "assets/icons/Twon_Team_Logo.png"),
    BrandItem(image: "assets/icons/Sony_Logo.png"),
  ];

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 200,
        leading: Row(
          children: [
            SizedBox(width: 20),
            CircleAvatar(radius: 20),
            SizedBox(width: 10.w),
            Text(
              "Hi, Rober",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/Bell_Icon_UIA.png',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CustomSearchBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ScrolledOffer(items: widget.items),
                  SectionTitle(title: "Popular Product"),
                  ScrolledProducts(
                    products: widget.products,
                    onFavTap: (index) {
                      setState(() {
                        widget.products[index].isFav =
                            !widget.products[index].isFav;
                      });
                    },
                    onStarTap: (index) {
                      setState(() {
                        widget.products[index].isStar =
                            !widget.products[index].isStar;
                      });
                    },
                  ),

                  SizedBox(height: 10.h),

                  SectionTitle(title: "Category"),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: widget.categories.length,
                    itemBuilder: (context, index) => CategoryItem(
                      title: widget.categories[index].title,
                      image: widget.categories[index].image,
                    ),
                  ),

                  SectionTitle(title: "Best for You"),

                  ScrolledProducts(
                    products: widget.products,
                    onFavTap: (index) {
                      setState(() {
                        widget.products[index].isFav =
                            !widget.products[index].isFav;
                      });
                    },
                    onStarTap: (index) {
                      setState(() {
                        widget.products[index].isStar =
                            !widget.products[index].isStar;
                      });
                    },
                  ),

                  SectionTitle(title: "Brands"),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: widget.brands.length,
                    itemBuilder: (context, index) =>
                        BrandItem(image: widget.brands[index].image),
                  ),

                  SectionTitle(title: "Buy Again"),

                  ScrolledProducts(
                    products: widget.products,
                    onFavTap: (index) {
                      setState(() {
                        widget.products[index].isFav =
                            !widget.products[index].isFav;
                      });
                    },
                    onStarTap: (index) {
                      setState(() {
                        widget.products[index].isStar =
                            !widget.products[index].isStar;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
