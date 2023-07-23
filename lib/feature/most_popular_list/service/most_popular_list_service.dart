// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:media_probe_app/constants/service_constants.dart';
import 'package:media_probe_app/core/base/app_result.dart';
import 'package:media_probe_app/core/dio/dio_http_client.dart';
import 'package:media_probe_app/feature/most_popular_list/model/most_popular_response.dart';

class MostPopularListService {
  DioHttpClient? _dioHttpClient;
  MostPopularListService(DioHttpClient dioHttpClient) {
    _dioHttpClient = dioHttpClient;
  }

  Future<AppResult<MostPopularResponse>> getMostPopuler({int period = 1}) async {
    try {
      final response = await _dioHttpClient!.get("$period.json?api-key=${ServiceConstants.apiKey}");
      if (response.statusCode == HttpStatus.ok) {
        return AppResult.fromSuccess(MostPopularResponse.fromJson(response.items));
      } else {
        return AppResult.fromError("statusCode is not 200");
      }
    } catch (e) {
      log(e.toString());
      return AppResult.fromError(e);
    }
  }
}
