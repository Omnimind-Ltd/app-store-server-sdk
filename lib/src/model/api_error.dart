import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

//Retryable errors
const accountNotFoundRetryableError = 4040002;
const appNotFoundRetryableError = 4040004;
const generalInternalRetryableError = 5000001;
const originalTransactionIdNotFoundRetryableError = 4040006;

// Errors
const accountNotFoundError = 4040001;
const appNotFoundError = 4040003;
const generalInternalError = 5000000;
const generalBadRequestError = 4000000;
const invalidAppIdentifierError = 4000002;
const invalidExtendByDaysError = 4000009;
const invalidExtendReasonCodeError = 4000010;
const invalidOriginalTransactionIdError = 4000008;
const invalidRequestIdentifierError = 4000011;
const invalidRequestRevisionError = 4000005;
const originalTransactionIdNotFoundError = 4040005;
const subscriptionExtensionIneligibleError = 4030004;
const subscriptionMaxExtensionError = 4030005;

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
