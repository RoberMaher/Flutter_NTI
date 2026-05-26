import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class textButton extends StatelessWidget {
  final String text;
  final void Function() ontap;

  const textButton({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      child: Text(
        text,
        style: TextStyle(
          color: const AppColors.light_blue_100,
          fontSize: 12.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          height: 1.36,
        ),
      ),
    );
  }
}
