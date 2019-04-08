import 'package:dio/dio.dart';
import 'dart:async';
import '../config/config.dart';

class HttpUtil {
  static Dio dio;

  static const String baseUrl = Config.host;
  static const int connectTimeout = 10000;
  static const int receiveTimeout = 3000;

  static Dio createInstance() {
    if (dio == null) {
      return Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout));
    }
    return dio;
  }

  Future<Map> request(String url, {data, method}) async {
    data = data ?? {};
    method = method ?? 'GET';
    dio = createInstance();
    var result;
    try {
      Response response = await dio.request(url,
          data: data, options: new Options(method: method));
      result = response.data;
    } on DioError catch (e) {
      print(e.toString());
    } finally {
      clear();
    }
    return result;
  }

  static void clear() {
    dio = null;
  }
}
