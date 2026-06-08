import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marketi_nti/core/networking/handle_error.dart';

class ApiConsumer {
  Dio dio = Dio();

  Future<Response?> post({
    Map<String, dynamic>? queryParameters,
    required BuildContext context,
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      HandleError(e, context);
      return null;
    }
  }

  Future<Response> get(
    Map<String, dynamic>? queryParameters, {
    required String url,

    required Map<String, dynamic> data,
  }) async {
    Response response = await dio.get(
      url,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response> put(
    Map<String, dynamic>? queryParameters, {
    required String url,

    required Map<String, dynamic> data,
  }) async {
    Response response = await dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }
}
