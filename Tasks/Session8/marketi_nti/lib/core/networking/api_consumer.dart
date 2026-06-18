import 'package:dio/dio.dart';

class ApiConsumer {
  Dio dio = Dio();

  ApiConsumer() {
    dio.options.baseUrl = 'https://accessories-eshop.runasp.net/api/';
  }

  Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await Dio().post(url, data: data);
  }

  Future<Response> get({required String url, required String token}) async {
    Response response = await dio.get(
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      url,
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
