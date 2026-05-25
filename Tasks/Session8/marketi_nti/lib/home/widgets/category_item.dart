import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  const CategoryItem({required this.title, required this.image, super.key});

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
            child: Image.asset(image),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            color: Color(0xFF001640),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
