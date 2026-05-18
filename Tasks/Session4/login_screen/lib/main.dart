import 'package:flutter/material.dart';
import 'package:login_screen/XO.dart';
import 'package:login_screen/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/XoGame': (context) => XoGame(),
      },
    ),
  );
}