import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/home/widgets/product_model.dart';
import 'package:marketi_nti/home/widgets/product_card.dart';

class ScrolledProducts extends StatelessWidget {
  const ScrolledProducts({
    super.key,
    required this.products,
    required this.onFavTap,
    required this.onStarTap,
  });

  final List<ProductModel> products;
  final Function(int index) onFavTap;
  final Function(int index) onStarTap;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 144.h,
        viewportFraction: 0.46,
        enableInfiniteScroll: false,
        clipBehavior: Clip.none,        
      ),
      items: products.asMap().entries.map((entry) {
        final index = entry.key;
        final product = entry.value;

        return ProductCard(
          product: product,
          onFavTap: () => onFavTap(index),
          onStarTap: () => onStarTap(index),
        );
      }).toList(),
    );
  }
}
