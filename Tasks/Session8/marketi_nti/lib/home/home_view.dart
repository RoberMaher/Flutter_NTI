import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/home/widgets/brand_item.dart';
import 'package:marketi_nti/home/widgets/category_item.dart';
import 'package:marketi_nti/home/widgets/scrolled_offers.dart';
import 'package:marketi_nti/home/widgets/scrolled_products.dart';
import 'package:marketi_nti/home/widgets/search_bar.dart';
import 'package:marketi_nti/home/widgets/section_title.dart';
import 'package:marketi_nti/home/home_data.dart';
import 'package:marketi_nti/shared/costom_app_bar.dart';

class HomeView extends StatefulWidget {
  final HomeData homeData = HomeData();
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: costomAppBar(),
      body: Column(
        children: [
          CustomSearchBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ScrolledOffer(items: HomeData.offers),
                  SectionTitle(title: "Popular Product"),
                  ScrolledProducts(
                    products: HomeData.products,
                    onFavTap: (index) {
                      setState(() {
                        HomeData.products[index].isFav =
                            !HomeData.products[index].isFav;
                      });
                    },
                    onStarTap: (index) {
                      setState(() {
                        HomeData.products[index].isStar =
                            !HomeData.products[index].isStar;
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
                    itemCount: HomeData.categories.length,
                    itemBuilder: (context, index) => CategoryItem(
                      title: HomeData.categories[index].title,
                      image: HomeData.categories[index].image,
                    ),
                  ),

                  SectionTitle(title: "Best for You"),

                  ScrolledProducts(
                    products: HomeData.products,
                    onFavTap: (index) {
                      setState(() {
                        HomeData.products[index].isFav =
                            !HomeData.products[index].isFav;
                      });
                    },
                    onStarTap: (index) {
                      setState(() {
                        HomeData.products[index].isStar =
                            !HomeData.products[index].isStar;
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
                    itemCount: HomeData.brands.length,
                    itemBuilder: (context, index) =>
                        BrandItem(image: HomeData.brands[index].image),
                  ),

                  SectionTitle(title: "Buy Again"),

                  ScrolledProducts(
                    products: HomeData.products,
                    onFavTap: (index) {
                      setState(() {
                        HomeData.products[index].isFav =
                            !HomeData.products[index].isFav;
                      });
                    },
                    onStarTap: (index) {
                      setState(() {
                        HomeData.products[index].isStar =
                            !HomeData.products[index].isStar;
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


