// home/widgets/scrolled_products.dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:marketi_nti/home/models/product_model.dart';
import 'package:marketi_nti/home/widgets/product_card.dart';

class ScrolledProducts extends StatelessWidget {
  const ScrolledProducts({
    super.key,
    required this.products,
    required this.onFavTap,
    required this.onStarTap,
  });

  final List<ProductModel> products;
  final Function(ProductModel product) onFavTap;
  final Function(ProductModel product) onStarTap;

  @override
  Widget build(BuildContext context) {
    final isLoading = products.isNotEmpty && products.first.id == 0;

    return Skeletonizer(
      enabled: isLoading,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 144.h,
          viewportFraction: 0.46,
          enableInfiniteScroll: false,
          clipBehavior: Clip.none,
          enlargeCenterPage: false,
        ),
        items: products.map((product) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: ProductCard(
              product: product,
              onFavTap: isLoading ? () {} : () => onFavTap(product),
              onStarTap: isLoading ? () {} : () => onStarTap(product),
            ),
          );
        }).toList(),
      ),
    );
  }
}
