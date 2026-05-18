import 'package:flutter/material.dart';
import 'package:login_screen/button.dart';
import 'package:login_screen/item.dart';
import 'package:login_screen/page_title.dart';
import 'package:login_screen/sign_up_form.dart';
import 'package:login_screen/titles.dart';

class Home extends StatefulWidget {
  static const String routeName = 'home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(color: const Color.fromARGB(255, 18, 79, 94)),

          Column(
            children: [
              const Spacer(flex: 2),

              const PageTitle(text: "MOMENTUM"),

              const Titles(
                title1: "GROWTH",
                title2: "HAPPENS",
                title3: "TODAY",
              ),

              const Spacer(flex: 1),

              const Item(text1: "SIGN IN", text2: "SIGN UP"),

              const SizedBox(height: 50),

              CustomFormField(
                text: "Enter your Email",
                icon: Icons.email,
                controller: emailController,
                isPassword: false,
                formKey: emailFormKey,
              ),

              const SizedBox(height: 30),

              CustomFormField(
                text: "Enter your Password",
                icon: Icons.lock,
                controller: passwordController,
                isPassword: true,
                formKey: passwordFormKey,
              ),

              const SizedBox(height: 50),

              Button(
                text: "SIGN IN",
                onTap: () {
                  final emailValid = emailFormKey.currentState!.validate();

                  final passwordValid = passwordFormKey.currentState!
                      .validate();

                  if (emailValid && passwordValid) {
                    Navigator.pushReplacementNamed(context, '/XoGame');
                  }
                },
              ),

              const Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
