import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ui/common/utils/delayed_util.dart';
import 'package:flutter_ui/global.dart';

class HttpUtils {

  static Dio _dio;
  static BaseOptions _options = BaseOptions(
    connectTimeout: 1500,
    receiveTimeout: 1000,
  );

  static get(String url, {params, Function success, Function fail, Function always,bool hasLoading = true}) {
    if(hasLoading){
      EasyLoading.show(status: 'loading...');
    }

    DelayedUtil.delayed(2000, () async{
      Dio dio = buildDio();
      try {
        Response response = await dio.get(url, queryParameters: params);
        success(response.data);
      } catch (e) {
        fail(e);
      } finally {
        if(always != null){
          always();
        }
        if(hasLoading) {
          EasyLoading.dismiss();
        }
      }
    });

  }

  static post(String url, {params, options, Function success, Function fail,Function always,bool hasLoading = true})  {
    if(hasLoading){
      EasyLoading.show(status: 'loading...');
    }

    DelayedUtil.delayed(2000, () async{
      Dio dio = buildDio();
      try {
        Response response = await dio.post(url, data: params, options: options);
        success(response.data);
      } catch (e) {
        fail(e.toString());
      } finally {
        if(always != null){
          always();
        }
        if(hasLoading) {
          EasyLoading.dismiss();
        }
      }
    });
  }

  static Dio buildDio() {
    if (_dio == null) {
      _dio = Dio(_options);
    }
    String token = '';
    if(Global.userInfo != null && Global.userInfo.token != null){
      token = Global.userInfo.token;
    }
    _dio.options.headers ={
      'token': token,
    };
    return _dio;
  }
}
