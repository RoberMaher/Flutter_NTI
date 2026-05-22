// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/widgets/custom_text_form_field.dart';
import 'package:marketi_nti/auth/widgets/skip_button.dart';

class SignInView extends StatefulWidget {
  bool value = false;

  SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: SizedBox(
            width: double.infinity,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 14.h),
                SkipButton(),
                SizedBox(height: 7.h),
                Center(
                  child: Image.asset(
                    'assets/images/Logo_Log_In.png',
                    fit: BoxFit.cover,
                    width: 300.w,
                    height: 250.h,
                  ),
                ),
                SizedBox(height: 32.h),

                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: emailController,
                        iconPath: 'assets/icons/evaEmailOutline2.png',
                        hint: 'Username or Email',
                        isEmail: true,
                      ),

                      SizedBox(height: 14.h),

                      CustomTextFormField(
                        controller: passwordController,
                        iconPath: 'assets/icons/Password_Icon.png',
                        hint: 'Password',
                        isPassword: true,
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Transform.translate(
                                offset: Offset(7, 0),
                                child: Checkbox.adaptive(
                                  // visualDensity: VisualDensity(horizontal: -4.w, vertical: -4.h),
                                  // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  activeColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.all(
                                      Radius.circular(4.r),
                                    ),
                                  ),
                                  value: widget.value,
                                  onChanged: (value) {
                                    widget.value = value!;
                                    setState(() {});
                                  },
                                ),
                              ),
                              Text(
                                'Remember Me',
                                style: TextStyle(
                                  color: const Color(0xFF51526B) /* navy */,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 1.34,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: const Color(0xFF3F80FF),
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.36,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  height: 44.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        side: BorderSide(color: Colors.blue, width: 2.w),
                      ),
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 12.h),
                Center(
                  child: Text(
                    'Or Continue With',
                    style: TextStyle(
                      color: const Color(0xFF51526B) /* navy */,
                      fontSize: 13.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.34,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      clipBehavior: Clip.antiAlias,
                      shape: CircleBorder(),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/Google_Icon.png',
                          width: 60.w,
                          height: 50.h,
                        ),
                      ),
                    ),

                    Material(
                      clipBehavior: Clip.antiAlias,
                      shape: CircleBorder(),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/Apple_Icon.png',
                          width: 60.w,
                          height: 50.h,
                        ),
                      ),
                    ),
                    Material(
                      clipBehavior: Clip.antiAlias,
                      shape: CircleBorder(),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/Facebok_Icon.png',
                          width: 60.w,
                          height: 50.h,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: const Color(0xFF51526B) /* navy */,
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.34,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: const Color(0xFF3F80FF),
                          fontSize: 12.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1.36,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
