import 'package:betweener_app/app/util/resources/constants_manager.dart';
import 'package:betweener_app/core/services/app_exception.dart';
import 'package:dio/dio.dart';

import 'logger.dart';

class DioHelper {
  static late final Dio dio;
  static late final Dio _benzolDio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    _benzolDio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(dioLoggerInterceptor);
    _benzolDio.interceptors.add(dioLoggerInterceptor);
  }

  post(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    Function(ApiException)? onError,
    Function(int total, int progress)? onSendProgress,
    Function(int total, int progress)? onReceiveProgress,
    Function? onLoading,
    dynamic data,
  }) async {
    try {
      onLoading?.call();
      var response = await dio.post(
        url,
        data: data,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      await onSuccess.call(response);
    } on DioException catch (error) {
      onError?.call(
        ApiException(
          message: DioExceptionClass.fromDioError(error).toString(),
          url: ApiEndPoints.baseUrl + url,
        ),
      );
    }
  }

  get(String url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      required Function(Response response) onSuccess,
      required Function(ApiException)? onError,
      Function(int value, int progress)? onReceiveProgress,
      Function? onLoading,
      bool isBenzolLink = false}) async {
    try {
      onLoading?.call();
      late Response response;

      if (isBenzolLink == false) {
        response = await dio
            .get(
              url,
              onReceiveProgress: onReceiveProgress,
              queryParameters: queryParameters,
              options: Options(
                headers: headers,
              ),
            )
            .timeout(
              const Duration(
                seconds: 15,
              ),
            );
      } else {
        response = await _benzolDio
            .get(
              url,
              onReceiveProgress: onReceiveProgress,
              queryParameters: queryParameters,
              options: Options(
                headers: headers,
              ),
            )
            .timeout(
              const Duration(
                seconds: 15,
              ),
            );
      }
      await onSuccess(response);
    } on DioException catch (error) {
      onError?.call(
        ApiException(
          message:
              error.response != null && error.response!.data["message"] != ""
                  ? error.response!.data["message"]
                  : DioExceptionClass.fromDioError(error).toString(),
          url: ApiEndPoints.baseUrl + url,
        ),
      );
    }
  }

  put(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    Function(ApiException)? onError,
    Function(int total, int progress)? onSendProgress,
    Function(int total, int progress)? onReceiveProgress,
    Function? onLoading,
    dynamic data,
  }) async {
    try {
      // 1) indicate loading state
      onLoading?.call();
      // 2) try to perform http request
      var response = await dio.put(
        url,
        data: data,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          receiveTimeout: const Duration(seconds: 15),
          sendTimeout: const Duration(seconds: 15),
        ),
      );
      // 3) return response (api done successfully)
      await onSuccess.call(response);
    } on DioException catch (error) {
      onError?.call(
        ApiException(
          message:
              error.response != null && error.response!.data["message"] != ""
                  ? error.response!.data["message"]
                  : DioExceptionClass.fromDioError(error).toString(),
          url: ApiEndPoints.baseUrl + url,
        ),
      );
    }
  }

  delete(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    Function(ApiException)? onError,
    Function? onLoading,
    dynamic data,
  }) async {
    try {
      onLoading?.call();
      var response = await dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          receiveTimeout: const Duration(seconds: 15),
          sendTimeout: const Duration(seconds: 15),
        ),
      );
      // 3) return response (api done successfully)
      await onSuccess.call(response);
    } on DioException catch (error) {
      onError?.call(
        ApiException(
          message:
              error.response != null && error.response!.data["message"] != ""
                  ? error.response!.data["message"]
                  : DioExceptionClass.fromDioError(error).toString(),
          url: ApiEndPoints.baseUrl + url,
        ),
      );
    }
  }
}
