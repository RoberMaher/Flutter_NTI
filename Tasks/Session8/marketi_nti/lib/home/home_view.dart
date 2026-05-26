import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/core/app_color.dart';
import 'package:marketi_nti/home/widgets/brand_item.dart';
import 'package:marketi_nti/home/widgets/category_item.dart';
import 'package:marketi_nti/home/widgets/scrolled_offers.dart';
import 'package:marketi_nti/home/widgets/scrolled_products.dart';
import 'package:marketi_nti/home/widgets/search_bar.dart';
import 'package:marketi_nti/home/widgets/section_title.dart';
import 'package:marketi_nti/home/home_data.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 200,
        leading: Row(
          children: [
            SizedBox(width: 20),
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.light_blue_500, width: 4),
              ),
              child: CircleAvatar(
                radius: 20,
                // backgroundImage: AssetImage(''),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              'Hi, Rober',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
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

GetAllProducts() async {
  final dio = Dio();
  final response = await dio.get('https://dummyjson.com/products');
}
