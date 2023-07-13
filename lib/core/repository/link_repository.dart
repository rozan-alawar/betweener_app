import 'package:dio/dio.dart';

import '../../app/locator.dart';
import '../../app/util/resources/constants_manager.dart';
import '../models/link_model.dart';
import '../services/api_base_helper.dart';
import '../services/app_exception.dart';

class LinkRepository {
  final DioHelper _helper = locator<DioHelper>();

  //example - you can use cashed user token
  String userToken = '1|LajBiiQSs1r9FOVowIXKpdFJYQAzCvrhCOjND7iM';

  Future<List<Link>> fetchLinkList({
    required dynamic Function(Response<dynamic>) onSuccess,
    dynamic Function(ApiException)? onError,
    Function? onLoading,
  }) async {
    final response = await _helper.get(
      ApiEndPoints.addLink,
      headers: {
        'Authorization': 'Bearer $userToken',
      },
      onSuccess: onSuccess,
      onError: onError,
      onLoading: onLoading,
    );
    return LinkResponse.fromJson(response).results;
  }

  // Future<dynamic> addLink() async {
  //   final response = await _helper.post(url:ApiEndPoints,body:  );
  //   return LinkResponse.fromJson(response).results;
  // }

  // Future<dynamic> updateLink() async {
  //   final response = await _helper.put("", {});
  //   return LinkResponse.fromJson(response).results;
  // }
}
