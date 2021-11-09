import 'package:json_annotation/json_annotation.dart';

part 'extend_renewal_date.g.dart';

/// The request body containing subscription-renewal-extension data.
@JsonSerializable()
class ExtendRenewalDateRequest {
  ///  The number of days to extend the subscription renewal date. The maximum value is 90 days.
  final int extendByDays;

  /// The reason code for the subscription date extension.
  final int extendReasonCode;

  ///  A string that contains a value you provide to uniquely identify this renewal-date-extension request. The maximum length of the string is 128 characters.
  final String requestIdentifier;

  ExtendRenewalDateRequest(
      {required this.extendByDays,
      required this.extendReasonCode,
      required this.requestIdentifier});

  Map<String, dynamic> toJson() => _$ExtendRenewalDateRequestToJson(this);

  factory ExtendRenewalDateRequest.fromJson(Map<String, dynamic> json) =>
      _$ExtendRenewalDateRequestFromJson(json);
}

/// A response that indicates whether the renewal-date extension succeeded and related details.
@JsonSerializable()
class ExtendRenewalDateResponse {
  /// The date that the successful subscription-renewal extension begins.
  final String effectiveDate;

  /// The original transaction identifier of the subscription that experienced a service interruption.
  final String originalTransactionId;

  /// A Boolean value that indicates whether the subscription-renewal-date extension succeeded.
  final bool success;

  /// A unique ID that identifies subscription-purchase events including subscription renewals, across devices.
  final String webOrderLineItemId;

  const ExtendRenewalDateResponse(this.effectiveDate,
      this.originalTransactionId, this.success, this.webOrderLineItemId);

  Map<String, dynamic> toJson() => _$ExtendRenewalDateResponseToJson(this);

  factory ExtendRenewalDateResponse.fromJson(Map<String, dynamic> json) =>
      _$ExtendRenewalDateResponseFromJson(json);

  @override
  String toString() {
    return 'ExtendRenewalDateResponse{effectiveDate: $effectiveDate, '
        'originalTransactionId: $originalTransactionId, success: $success, '
        'webOrderLineItemId: $webOrderLineItemId}';
  }
}
