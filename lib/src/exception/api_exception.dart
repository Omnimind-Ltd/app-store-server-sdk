import 'package:app_store_server_sdk/src/model/api_error.dart';

class ApiException implements Exception {
  final int statusCode;

  final String? response;

  final ApiError? error;

  const ApiException(this.statusCode, {this.error, this.response});

  @override
  String toString() {
    return 'ApiException{statusCode: $statusCode, error: $error}';
  }
}
