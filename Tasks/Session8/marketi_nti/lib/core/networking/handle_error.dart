import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

HandleError(DioException e, BuildContext context) {
  switch (e.response!.statusCode) {
    case 400:
      String errorMessage = '';
      e.response!.data['errors'].forEach((error) => errorMessage += '$error\n');
      // if (!mounted) return;
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: '${e.response!.data['message']}',
        desc: '${errorMessage.trim()}',
        btnOkOnPress: () {},
      ).show();
      break;
    default:
      // if (!mounted) return;
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
