// ignore: unused_element
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:marketi_nti/auth/models/error_model.dart';

String handleError(
  DioException e,
) {
  if (e.type case DioExceptionType.badResponse) {
    switch (e.response?.statusCode) {
      case 400:
        ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
        String errorMessage = '';
        errorModel.errors.forEach((error) => errorMessage += '$error\n');

        return errorMessage;

      case 401:
        ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
        String errorMessage = '';
        errorModel.errors.forEach((error) => errorMessage += '$error\n');

          return errorMessage;

      case 403:
        ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
        String errorMessage = '';
        errorModel.errors.forEach((error) => errorMessage += '$error\n');

        return errorMessage;

      case 404:
        ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
        String errorMessage = '';
        errorModel.errors.forEach((error) => errorMessage += '$error\n');

        return errorMessage;

      case 422:
        ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
        String errorMessage = '';
        errorModel.errors.forEach((error) => errorMessage += '$error\n');

        return errorMessage;

      case 500:
        log('Internal Server Error');
        return 'Internal Server Error. Please try again later.';
      //
    }
  } else if (e.type case DioExceptionType.connectionTimeout) {
    return 'Connection timed out. Please try again later.';
  } else if (e.type case DioExceptionType.receiveTimeout) {
    return 'Connection timed out. Please try again later.';
  } else if (e.type case DioExceptionType.sendTimeout) {
    return 'Connection timed out. Please try again later.';
  } else if (e.type case DioExceptionType.unknown) {
    log('An unexpected error occurred: ${e.message}');
    return 'An unexpected error occurred. Please try again later.';
  } else if (e.type case DioExceptionType.cancel) {
    log('Request was cancelled: ${e.message}');
    return 'Request was cancelled.';
  } else {
    return 'An unexpected error occurred. Please try again later.';
  }
  return 'An unexpected error occurred. Please try again later.';
}