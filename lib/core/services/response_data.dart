class ResponseData {
  final bool isSuccess;
  final String? message;
  final dynamic data;
  final int? statusCode;
  final dynamic errorDetails; // extra field

  ResponseData({
    required this.isSuccess,
    this.message,
    this.data,
    this.statusCode,
    this.errorDetails,
  });

  void operator [](String other) {}
}
