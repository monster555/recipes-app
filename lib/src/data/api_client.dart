import 'package:dio/dio.dart';

class ApiClient {
  static const baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1';
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: baseUrl));

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 15000,
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));
    return dio;
  }
}

class Endpoint {
  static const String search = '/search.php?';
  static const String lookup = '/lookup.php?';
  static const String random = '/random.php';
  static const String latest = '/latest.php?';
  static const String list = '/list.php?';
  static const String filter = '/filter.php?';
}
