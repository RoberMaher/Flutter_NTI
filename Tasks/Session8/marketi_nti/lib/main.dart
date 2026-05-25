import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marketi_nti/my_app.dart';

void main() async {
  final dio = Dio();
  final response = await dio.get('https://dummyjson.com/products');

  // log(response.data.toString());
  runApp(const MarktiNtiApp());
}
