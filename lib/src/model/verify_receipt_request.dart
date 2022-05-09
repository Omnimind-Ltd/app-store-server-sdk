import 'package:json_annotation/json_annotation.dart';

part 'verify_receipt_request.g.dart';

@JsonSerializable()
class VerifyReceiptRequest {
  final String password;

  @JsonKey(name: 'receipt-data')
  final String receiptData;

  @JsonKey(name: 'exclude-old-transactions')
  final bool excludeOldTransactions;

  VerifyReceiptRequest({
    required this.password,
    required this.receiptData,
    this.excludeOldTransactions = true,
  });

  Map<String, dynamic> toJson() => _$VerifyReceiptRequestToJson(this);

  factory VerifyReceiptRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyReceiptRequestFromJson(json);

  @override
  String toString() {
    return 'VerifyReceiptRequest{password: $password, receiptData: '
        '$receiptData, excludeOldTransactions: $excludeOldTransactions}';
  }
}
