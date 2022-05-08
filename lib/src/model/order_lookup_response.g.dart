// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderLookupResponse _$OrderLookupResponseFromJson(Map<String, dynamic> json) =>
    OrderLookupResponse(
      status: json['status'] as int?,
      signedTransactions: (json['signedTransactions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$OrderLookupResponseToJson(OrderLookupResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('signedTransactions', instance.signedTransactions);
  return val;
}
