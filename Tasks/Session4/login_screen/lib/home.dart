import 'package:flutter/material.dart';
import 'package:login_screen/button.dart';
import 'package:login_screen/input_label.dart';
import 'package:login_screen/item.dart';
import 'package:login_screen/page_title.dart';  
import 'package:login_screen/titles.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(color: const Color.fromARGB(255, 18, 79, 94)),
          Column(
            children: [
              SizedBox(height: 100),
              PageTitle(text: "MOMENTUM"),
              Titles(title1: "GROWTH", title2: "HAPPENS", title3: "TODAY"),
              SizedBox(height: 100),
              Item(text1: "SIGN IN", text2: "SIGN UP"),
              SizedBox(height: 50),
              InputLabel(text: "Enter your Email", icon: Icons.email),
              SizedBox(height: 30),
              InputLabel(text: "Enter your Password", icon: Icons.lock),
              SizedBox(height: 50),
            ],
          ),
          Button(text: "SIGN UP",),
        ],
      ),
    );
  }
}