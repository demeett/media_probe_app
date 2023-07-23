
import 'custom_http_response.dart';

abstract class CustomHttpClient {
  abstract int receiveTimeout;
  abstract int connectTimeout;
  abstract int sendTimeout;

  Future<CustomHttpResponse> get(
    final String path, [
    final Map<String, dynamic> queryParams,
    final Map<String, dynamic> headers,
  ]);
}