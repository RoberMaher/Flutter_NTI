import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

HandleError(DioException e, BuildContext context) {
  switch (e.response!.statusCode) {
    case 400:
      String errorMessage = '';

      final errors = e.response!.data['errors'];

      if (errors is Map) {
        errors.forEach((key, value) {
          for (var err in value) {
            errorMessage += '$err\n';
          }
        });
      } else if (errors is List) {
        for (var err in errors) {
          errorMessage += '$err\n';
        }
      }

      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: '${e.response!.data['message']}',
        desc: errorMessage.trim(),
        btnOkOnPress: () {},
      ).show();
      break;

    default:
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'Error',
        desc: 'Something went wrong. Please try again later.',
        btnOkOnPress: () {},
      ).show();
  }
}