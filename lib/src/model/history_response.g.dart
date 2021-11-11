// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryResponse _$HistoryResponseFromJson(Map<String, dynamic> json) =>
    HistoryResponse(
      json['environment'] as String,
      json['appAppleId'] as int?,
      json['bundleId'] as String,
      json['hasMore'] as bool,
      json['revision'] as String,
      (json['signedTransactions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HistoryResponseToJson(HistoryResponse instance) {
  final val = <String, dynamic>{
    'environment': instance.environment,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appAppleId', instance.appAppleId);
  val['bundleId'] = instance.bundleId;
  val['hasMore'] = instance.hasMore;
  val['revision'] = instance.revision;
  val['signedTransactions'] = instance.signedTransactions;
  return val;
}
