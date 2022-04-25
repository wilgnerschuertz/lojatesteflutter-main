// ignore_for_file: todo

import 'package:dio/dio.dart';

import 'http_client_interface.dart';

class DioClient implements IHttpClient {
  final dio = Dio();

  @override
  Future<dynamic> get(String url) async {
    final response = await dio.get(url);
    return response.data;

    // TODO: implement get
  }
}
