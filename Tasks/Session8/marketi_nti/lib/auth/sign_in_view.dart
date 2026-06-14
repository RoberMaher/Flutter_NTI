// ignore_for_file: must_be_immutable
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/sign_in_cubit/sign_in_cubit.dart';
import 'package:marketi_nti/auth/sign_up_view.dart';
import 'package:marketi_nti/auth/widgets/custom_text_form_field.dart';
import 'package:marketi_nti/auth/widgets/easy_registration.dart';
import 'package:marketi_nti/auth/widgets/main_button.dart';
import 'package:marketi_nti/auth/widgets/skip_button.dart';
import 'package:marketi_nti/auth/widgets/text_button.dart';
import 'package:marketi_nti/core/app_color.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';

class SignInView extends StatefulWidget {
  ApiConsumer apiConsumer = ApiConsumer();
  bool value = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
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
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushNamed(context, '/bottom_navigation');
        } else if (state is SignInFailure) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title: 'Error',
            desc: state.errorMessage,
            btnOkOnPress: () {},
          ).show();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
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
                        key: widget.formKey,
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
                                          borderRadius:
                                              BorderRadiusGeometry.all(
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
                                        color: const Color(
                                          0xFF51526B,
                                        ) /* navy */,
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
                          // validate  of the format email and password length
                          if (widget.formKey.currentState!.validate()) {
                            // post request that send email and password  to login with this credantials and get the access token and refresh token and save them in shared preferences
                            context.read<SignInCubit>().signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                          }
                        },
                        text: "Sign In",
                      ),
                      SizedBox(height: 12.h),

                      EasyRegistration(),

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
                            onPressed: () {
                              Navigator.pushNamed(context, '/sign_up');
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: AppColors.light_blue_100,
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
          ),
        ),
      ),
    );
  }

  login() async {}
}
