// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefundLookupResponse _$RefundLookupResponseFromJson(
        Map<String, dynamic> json) =>
    RefundLookupResponse(
      (json['signedTransactions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RefundLookupResponseToJson(
        RefundLookupResponse instance) =>
    <String, dynamic>{
      'signedTransactions': instance.signedTransactions,
    };
