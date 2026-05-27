import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/core/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final String hint;
  final String iconPath;
  final TextEditingController controller;
  final bool isPassword;
  final bool isEmail;
  final bool isPhone;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.label,
    required this.hint,
    required this.iconPath,
    required this.controller,
    this.isPassword = false,
    this.isEmail = false,
    this.isPhone = false,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Text(
              widget.label!,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0XFF001640),
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 0.5.h),
          ],

          TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? obscureText : false,
            style: const TextStyle(color: Colors.black),

            keyboardType: widget.isPhone
                ? TextInputType.phone
                : widget.isEmail
                ? TextInputType.emailAddress
                : TextInputType.text,

            validator:
                widget.validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return "${widget.hint} can't be empty";
                  }

                  if (widget.isEmail) {
                    final emailRegex = RegExp(r'@');
                    if (!emailRegex.hasMatch(value)) {
                      return "Invalid email";
                    }
                  }

                  if (widget.isPassword && value.length < 6) {
                    return "Password must be at least 6 characters";
                  }

                  return null;
                },

            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                height: 1.34,
                color: Color(0xFF929BAB),
              ),

              prefixIcon: Padding(
                padding: EdgeInsets.all(12.w),
                child: Image.asset(widget.iconPath, width: 20.w, height: 20.h),
              ),

              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: const Color.fromARGB(255, 0, 22, 64),
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    )
                  : null,

              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color:  AppColors.light_blue_500,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(14.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:  AppColors.light_blue_500.withAlpha(100),
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(14.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.light_blue_500,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
