import 'package:dio/dio.dart';

class HttpUtils {

  static Dio _dio;
  static BaseOptions _options = BaseOptions(
    connectTimeout: 1500,
    receiveTimeout: 1000,
  );

  static get(String url, {params, Function success, Function fail}) async {
    Dio dio = buildDio();
    try {
      Response response = await dio.get(url, queryParameters: params);
      success(response.data);
    } catch (e) {
      fail(e);
    }
  }

  static post(String url, {params, options, Function success, Function fail}) async {
    Dio dio = buildDio();
    try {
      Response response = await dio.post(url, data: params, options: options);
      success(response.data);
    } catch (e) {
      fail(e.toString());
    }
  }

  static Dio buildDio() {
    if (_dio == null) {
      _dio = Dio(_options);
    }
    // _dio.options.headers
    return _dio;
  }
}
