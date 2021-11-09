// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderLookupResponse _$OrderLookupResponseFromJson(Map<String, dynamic> json) =>
    OrderLookupResponse(
      json['status'] as int,
      (json['signedTransactions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$OrderLookupResponseToJson(
        OrderLookupResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'signedTransactions': instance.signedTransactions,
    };
