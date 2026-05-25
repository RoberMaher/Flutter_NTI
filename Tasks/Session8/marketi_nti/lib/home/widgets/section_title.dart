import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            // Spacer(),
          
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 14.0, bottom: 4, top: 4),
          child: TextButton(
            onPressed: () {},
            child: Text(
              "View all",
              style: TextStyle(
                color: const Color(0xFF3F80FF),
                fontSize: 16.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 1.36,
              ),
            ),
          )
        ),
      ],
    );
  }
}
