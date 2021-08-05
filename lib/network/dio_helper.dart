import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://almezayn.qhorse.online/api',
      receiveDataWhenStatusError: true,
    ));
  }

  /// using get data.
  static Future<Response> getData(
      {@required url, @required Map<String, dynamic> query, String token}) async {
     dio.options.headers ={
       'Authorization' : "Bearer " + token,
     };
    return await dio.get(url, queryParameters: query, );
  }

  /// using get date without using query parameters.
  static Future<Response> getAllData({@required url, String token}) async {
    dio.options.headers ={
        'Authorization' : "Bearer " +  token,
    };
    return await dio.get(url);
  }

  static Future<Response> postData({
    @required url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,
    String token,
  }) {
     dio.options.headers = {
       'Authorization' : "Bearer " +  token ,
     };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }


  static Future<Response> postDataForAuth({
    @required url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,
    String token,
  }) {
    dio.options.headers = {
      'Authorization' :  token ,
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }


  static Future<Response> postDataForRegister({
    @required url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,

  }) {

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
