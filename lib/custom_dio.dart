import 'package:dio/dio.dart';
import 'package:paginnation_teste/interceptors.dart';

class CustomDio {
  final Dio dio = Dio();

  CustomDio() {
    dio.options.baseUrl = 'https://api.instantwebtools.net/v1';
    dio.interceptors.add(CustomInterceptors());
  }
}
