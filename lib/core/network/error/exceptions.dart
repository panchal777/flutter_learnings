class ServerException implements Exception {
  final String? message;
  final int? statusCode;

  ServerException(this.statusCode, this.message);
}

class CancelTokenException implements Exception {
  final String? message;
  final int? statusCode;

  CancelTokenException(this.statusCode, this.message);
}
