import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/sign_up_cubit/sign_up_cubit.dart';
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
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          CircularProgressIndicator();
        }
        if (state is SignUpSuccess) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            title: 'Success',
            desc: 'Registration Successful!',
            btnOkOnPress: () {
              Navigator.pushNamed(
                context,
                '/verification',
                arguments: emailController.text.trim(),
              );
            },
          ).show();
        }

        if (state is SignUpFailure) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: 'Error',
            desc: state.errorMessage,
            btnOkOnPress: () {},
          ).show();
        }
      },
      child: Scaffold(
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
                                    title: 'Warning',
                                    desc: 'Passwords do not match!',
                                    btnOkOnPress: () {},
                                  ).show();
                                  return;
                                }

                                context.read<SignUpCubit>().register(
                                  firstName: nameController.text.trim(),
                                  lastName: "Maher",
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
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
      ),
    );
  }
}
