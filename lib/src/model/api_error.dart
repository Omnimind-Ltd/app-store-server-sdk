import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

/// Errors returned by App Store Server API responses.
@JsonSerializable()
class ApiError {
  /// The error code
  final int errorCode;

  /// The human readable error message
  final String errorMessage;

  const ApiError(this.errorCode, this.errorMessage);

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  @override
  String toString() {
    return 'ApiError{errorCode: $errorCode, errorMessage: $errorMessage}';
  }
}
