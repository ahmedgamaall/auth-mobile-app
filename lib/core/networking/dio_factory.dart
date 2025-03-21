import 'package:auth_mobile_app/core/helpers/constants.dart';
import 'package:auth_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:dio/dio.dart';
import 'package:auth_mobile_app/core/networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.apiBaseUrl,
          receiveDataWhenStatusError: true,
        ),
      );
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static Future<Response> getDataUseToken({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken)}',
    };

    return await dio!.get(
      endPoint,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic>? data,
  }) async {
    dio?.options.headers = {'Content-Type': 'application/json'};
    return await dio!.post(endPoint, data: data);
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
