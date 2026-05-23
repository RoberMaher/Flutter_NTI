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
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();
  // ignore: non_constant_identifier_names
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController usernameController = TextEditingController();

  @override
  initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    usernameController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  dispose() {
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
      body: Padding(
        padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backButton(),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/images/Logo_Log_In.png',
                      fit: BoxFit.cover,
                      width: 187.58627319335938.w,
                      height: 160.h,
                    ),
                  ),
                ),
                SizedBox(width: 48.w),
              ],
            ),
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
            SizedBox(height: 14.h),
            MainButton(ontap: () {}, text: "Sign Up"),
            SizedBox(height: 16.h),
            EasyRegistration(),
          ],
        ),
      ),
    );
  }
}
