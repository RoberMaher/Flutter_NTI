// ignore_for_file: unused_local_variable, must_be_immutable

import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/models/error_model.dart';
import 'package:marketi_nti/auth/widgets/custom_text_form_field.dart';
import 'package:marketi_nti/auth/widgets/easy_registration.dart';
import 'package:marketi_nti/auth/widgets/main_button.dart';
import 'package:marketi_nti/auth/widgets/text_button.dart';
import 'package:marketi_nti/auth/widgets/skip_button.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:marketi_nti/core/networking/handle_error.dart';

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
            child: SingleChildScrollView(
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
                            textButton(
                              text: 'Forgot Password?',
                              ontap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/forgot_password',
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  MainButton(
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          var response = await ApiConsumer().post(
                            url:
                                'https://accessories-eshop.runasp.net/api/auth/login',
                            context: context,
                            data: {
                              'email': emailController.text,
                              'password': passwordController.text,
                            },
                          );

                          if (response?.statusCode == 200) {
                            Navigator.pushReplacementNamed(context, '/bottom_navigation');
                          }
                        } on DioException catch (e) {
                          HandleError(e, context); // يعرض ال dialog بتاعك
                        } catch (e) {
                          log(e.toString());
                        }
                      }
                    },
                    text: 'Sign In',
                  ),
                  SizedBox(height: 12.h),
                  EasyRegistration(),
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
                      textButton(
                        text: 'Sign Up',
                        ontap: () {
                          Navigator.pushNamed(context, '/sign_up');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
