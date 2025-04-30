import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:shop_app/core/cache/shared_preferences_helper.dart';
import 'api_constants.dart';

class ApiService {
  final Dio dio;
  ApiService()
      : dio = Dio(BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),

          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
          },
        )) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final lang = SharedPrefencesHelper.language ?? 'en';
        final token = SharedPrefencesHelper.token;

        options.headers.addAll({
          'lang': lang,
          if (token != null) 'Authorization': token,
        });

        return handler.next(options);
      },
    ));
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3),
      ],
    ));
  }
           
       

  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    return dio.post(endPoint, data: data);
  }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    return dio.get(endPoint, queryParameters: queryParams);
  }

  Future<Response> putData({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    return dio.put(endPoint, data: data);
  }

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    return dio.delete(endPoint, data: data);
  }
}
