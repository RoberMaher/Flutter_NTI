import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/home/widgets/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onFavTap;
  final VoidCallback onStarTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onFavTap,
    required this.onStarTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 160.w,
        height: 144.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD9E6FF).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
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
                    width: 152.w,
                    height: 96.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xFFD9E6FF),
                    ),
                    child: Image.asset(product.image, fit: BoxFit.contain),
                  ),
                  Positioned(
                    top: 6.h,
                    right: 6.w,
                    child: GestureDetector(
                      onTap: () {
                        onFavTap();
                      },
                      child: Container(
                        width: 24.w,
                        height: 24.h,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          product.isFav
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Color(0xFF001640),
                          size: 16.sp,
                          fontWeight: FontWeight.w700,
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
                      color: Color(0xFF001640),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      onStarTap();
                    },
                    child: Icon(
                      product.isStar ? Icons.star : Icons.star_border,
                      color: Color(0xFF001640),
                      size: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    "${product.rate}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF001640),
                    ),
                  ),
                  SizedBox(width: 4.w),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  product.name,
                  style: TextStyle(
                    color: Color(0xFF001640),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
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
