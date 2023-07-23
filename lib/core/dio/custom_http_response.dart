class CustomHttpResponse {
  CustomHttpResponse(
    this.items, [
    this.statusCode,
    this.statusMessage,
  ]);

  dynamic items;

  int? statusCode;

  String? statusMessage;
}