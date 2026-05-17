import 'package:flutter/material.dart';
import 'package:login_screen/home.dart';
import 'package:login_screen/my_app.dart'; 

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',

      routes: {
        '/home': (context) =>  Home(),
        '/counter': (context) => CounterScreen(),
      },
    ),
  );
}
