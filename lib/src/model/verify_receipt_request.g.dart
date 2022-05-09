// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_receipt_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyReceiptRequest _$VerifyReceiptRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyReceiptRequest(
      password: json['password'] as String,
      receiptData: json['receipt-data'] as String,
      excludeOldTransactions: json['exclude-old-transactions'] as bool? ?? true,
    );

Map<String, dynamic> _$VerifyReceiptRequestToJson(
        VerifyReceiptRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
      'receipt-data': instance.receiptData,
      'exclude-old-transactions': instance.excludeOldTransactions,
    };
