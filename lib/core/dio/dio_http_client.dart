import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:media_probe_app/constants/text_constants.dart';
import 'custom_http_client.dart';
import 'custom_http_response.dart';

class DioHttpClient implements CustomHttpClient {
  final Dio _dio;
  DioHttpClient(this._dio);
  //final Dio _dio = Dio();

  @override
  int connectTimeout = 15000;

  @override
  int receiveTimeout = 15000;

  @override
  int sendTimeout = 15000;

  @override
  Future<CustomHttpResponse> get(
    String path, [
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    Options? options,
  ]) async {
    try {} catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          log(TextConstants.unauthorized);
        } else {
          log('Hata: ${e.message}');
        }
      }
    }

    final Response response = await _dio.get(path, queryParameters: queryParams, options: options);
    return _responseToCustomHttpResponse(response);
  }

  CustomHttpResponse _responseToCustomHttpResponse(
    final Response response,
  ) {
    log("Response: ${response.realUri} ${response.data.toString()}");
    return CustomHttpResponse(
      response.data,
      response.statusCode,
      response.statusMessage,
    );
  }

  Future<CustomHttpResponse> post(String path, {Object? data}) async {
    final Response response = await _dio.post(path, data: data);
    return _responseToCustomHttpResponse(response);
  }

  Future<CustomHttpResponse> put(String path, {Object? data}) async {
    final Response response = await _dio.put(path, data: data);
    return _responseToCustomHttpResponse(response);
  }

  Future<CustomHttpResponse> download(
    String urlPath,
    Map<String, dynamic>? queryParams,
    String savePath,
  ) async {
    final response = await _dio.download(urlPath, savePath, queryParameters: queryParams);
    return _responseToCustomHttpResponse(response);
  }
}
