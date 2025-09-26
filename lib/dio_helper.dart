import 'package:dio/dio.dart';
import 'package:flutter_application_1/cash_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://todo.iraqsapp.com',
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        headers: {
          "Authorization": "Bearer ${CashHelper.getData(key: 'token')}",
        },
      ),
    );
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }

  static Future<Response> requestGet({
    required String endPoint,

    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(endPoint, queryParameters: query);
  }

  static Future<Response> requestPost({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.post(endPoint, data: data);
  }

  static Future<Response> requestEdit({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.put(endPoint, data: data);
  }


  static Future<Response> requestDelete({required String endPoint}) async {
    // Append the task ID to the endpoint URL
    return await dio!.delete(endPoint);
  }

  static Future<Response> requestProfile({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.get(endPoint, data: data);
  }
}

/*void requestGet() async {
  Response response;
  response = await dio.get('/auth/login', queryParameters: {'id': 12, 'name': 'dio'});
  print(response.data.toString());
}
*/
