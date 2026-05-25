import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandItem extends StatelessWidget {
  final String image;
  const BrandItem({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            height: 96.h,
            width: 105.w,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFB2CCFF), width: 1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.asset(image, height: 77.h, width: 85.w),
          ),
        ),
      ],
    );
  }
}
