// home/widgets/product_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/core/app_color.dart';
import 'package:marketi_nti/home/models/product_model.dart';
import 'package:marketi_nti/home/product_details.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onFavTap;
  final VoidCallback onStarTap;
  final VoidCallback? onRemoveTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onFavTap,
    required this.onStarTap,
    this.onRemoveTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsView(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD9E6FF).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 96.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: const Color(0xFFD9E6FF),
                    ),
                    child: Image.network(
                      product.thumbnail ?? '',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported);
                      },
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    right: 6.w,
                    child: GestureDetector(
                      onTap: onFavTap,
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          product.isFav
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: AppColors.dark_blue_900,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  if (onRemoveTap != null)
                    Positioned(
                      top: 6.h,
                      left: 6.w,
                      child: GestureDetector(
                        onTap: onRemoveTap,
                        child: Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SizedBox(width: 4.w),
                  Text(
                    "${product.price} LE",
                    style: TextStyle(
                      color: AppColors.dark_blue_900,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: onStarTap,
                    child: Icon(
                      product.isStar ? Icons.star : Icons.star_border,
                      color: AppColors.dark_blue_900,
                      size: 18.sp,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    "${product.rating}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.dark_blue_900,
                    ),
                  ),
                  SizedBox(width: 4.w),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    product.title ?? '',
                    maxLines: 2,
                    style: TextStyle(
                      color: AppColors.dark_blue_900,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}