import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final String iconPath;
  final TextEditingController controller;
  final bool isPassword;
  final bool isEmail;

  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.iconPath,
    required this.controller,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.black),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$hint can't be empty";
        }

        if (isEmail) {
          final emailRegex = RegExp(r'@');

          if (!emailRegex.hasMatch(value)) {
            return "Invalid email";
          }
        }

        if (isPassword && value.length < 6) {
          return "Password must be at least 6 characters";
        }

        return null;
      },

      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: Image.asset(
          iconPath,
          width: 20.w,
          height: 20.h,
          color: Colors.blue,
        ),

        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF8CB3FF), width: 2.w),
          borderRadius: BorderRadius.circular(14.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF8CB3FF).withAlpha(100),
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF8CB3FF).withAlpha(100),
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
      ),
    );
  }
}