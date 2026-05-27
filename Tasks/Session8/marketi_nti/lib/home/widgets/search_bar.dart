import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/core/app_color.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide(
              color: AppColors.light_blue_500.withOpacity(0.7),
              width: 2.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide(
              color: AppColors.light_blue_500.withOpacity(0.7),
              width: 2.w,
            ),
          ),
          prefixIcon: Image.asset('assets/icons/Search_Icons_UIA.png'),
          hintText: 'What are you looking for ? ',
          hintStyle: TextStyle(
            color: Color(0xFF929BAB),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(6),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8.r),
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.light_blue_500.withOpacity(0.7),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.all(6),
                  child: Image.asset(
                    'assets/icons/Filter.png',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
