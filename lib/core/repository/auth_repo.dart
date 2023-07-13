import 'package:betweener_app/app/locator.dart';
import 'package:betweener_app/app/util/resources/constants_manager.dart';
import 'package:dio/dio.dart';

import '../services/api_base_helper.dart';
import '../services/app_exception.dart';

class AuthRepository {
  final DioHelper _helper = locator<DioHelper>();

  login({
    required String email,
    required String password,
    required dynamic Function(Response<dynamic>) onSuccess,
    dynamic Function(ApiException)? onError,
    Function? onLoading,
  }) async {
    _helper.post(
      ApiEndPoints.login,
      data: {
        "email": email,
        "password": password,
      },
      onSuccess: onSuccess,
      onError: onError,
      onLoading: onLoading,
    );
  }

  updateLocation({
    required double lat,
    required double long,
    required int id,
    required dynamic Function(Response<dynamic>) onSuccess,
    dynamic Function(ApiException)? onError,
    Function? onLoading,
  }) async {
    _helper.put(
      '${ApiEndPoints.update}/$id',
      data: {
        "lat": 0,
        "long": 0,
      },
      onSuccess: onSuccess,
      onError: onError,
      onLoading: onLoading,
    );
  }

  register({
    required String name,
    required String email,
    required String password,
    required dynamic Function(Response<dynamic>) onSuccess,
    dynamic Function(ApiException)? onError,
    Function? onLoading,
  }) async {
    final response = await _helper.post(
      ApiEndPoints.register,
      data: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password,
      },
      onSuccess: onSuccess,
      onError: onError,
      onLoading: onLoading,
    );
  }
}
