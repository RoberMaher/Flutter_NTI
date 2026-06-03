import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/widgets/back_button.dart';
import 'package:marketi_nti/auth/widgets/custom_text_form_field.dart';
import 'package:marketi_nti/auth/widgets/easy_registration.dart';
import 'package:marketi_nti/auth/widgets/main_button.dart';

class SignUpView extends StatefulWidget {
  static const routeName = '/sign-up';
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 14.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      backButton(),
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            'assets/images/Logo_Log_In.png',
                            fit: BoxFit.cover,
                            width: 187.w,
                            height: 160.h,
                          ),
                        ),
                      ),
                      SizedBox(width: 48.w),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    label: "Your Name",
                    hint: "Full Name",
                    iconPath: 'assets/icons/Name_Icon.png',
                    controller: nameController,
                  ),
                  CustomTextFormField(
                    label: "Username",
                    hint: "Username",
                    iconPath: 'assets/icons/Username.png',
                    controller: usernameController,
                  ),
                  CustomTextFormField(
                    label: "Phone Number",
                    hint: "+20 123456789",
                    iconPath: 'assets/icons/Phone.png',
                    controller: phoneController,
                  ),
                  CustomTextFormField(
                    label: "Email Address",
                    hint: "You@gmail.com",
                    iconPath: 'assets/icons/evaEmailOutline2.png',
                    controller: emailController,
                    isEmail: true,
                  ),
                  CustomTextFormField(
                    label: "Password",
                    hint: "**********",
                    iconPath: 'assets/icons/Password_Icon.png',
                    controller: passwordController,
                    isPassword: true,
                  ),
                  CustomTextFormField(
                    label: "Confirm Password",
                    hint: "**********",
                    iconPath: 'assets/icons/Password_Icon.png',
                    controller: confirmPasswordController,
                    isPassword: true,
                  ),
                  SizedBox(height: 20.h),
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : MainButton(
                          ontap: () {
                            if (_formKey.currentState!.validate()) {
                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.warning,
                                  animType: AnimType.scale,
                                  title: 'Warning',
                                  desc: 'Passwords do not match!',
                                  btnOkOnPress: () {},
                                ).show();
                                return; // الـ return دي مهمة جداً عشان توقف الكود هنا وما تخليهوش ينزل للسطر اللي تحته
                              }

                              register();
                            }
                          },
                          text: "Sign Up",
                        ),
                  SizedBox(height: 16.h),
                  EasyRegistration(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    setState(() {
      isLoading = true;
    });

    try {
      Response response = await Dio().post(
        'https://accessories-eshop.runasp.net/api/auth/register',
        data: {
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
          "firstName": nameController.text.trim(),
          "lastName": 'Maher',
        },
      );

      if (response.statusCode == 200) {
        if (!mounted) return;

        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: 'Success',
          desc: 'Registration Successful!',
          btnOkOnPress: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/bottom_navigation',
              (route) => false,
            );
          },
        ).show();
      }
    } on DioException catch (e) {
      if (!mounted) return;
      String errorMessage = 'An unexpected error occurred';

      if (e.type == DioExceptionType.badResponse && e.response != null) {
        final responseData = e.response!.data;

        if (responseData is Map && responseData.containsKey('errors')) {
          var errors = responseData['errors'];
          if (errors is Map && errors.isNotEmpty) {
            errorMessage = errors.values.first.first.toString();
          }
        } else if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message'];
        }
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Connection timed out. Please check your internet.';
      }

      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'Error',
        desc: errorMessage,
        btnOkColor: Colors.red,
        btnOkOnPress: () {},
      ).show();
    } catch (e) {
      log('Unexpected error: $e');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
