// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusResponse _$StatusResponseFromJson(Map<String, dynamic> json) =>
    StatusResponse(
      json['environment'] as String,
      json['appAppleId'] as String?,
      json['bundleId'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => SubscriptionGroupIdentifierItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatusResponseToJson(StatusResponse instance) {
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
  val['data'] = instance.data;
  return val;
}

SubscriptionGroupIdentifierItem _$SubscriptionGroupIdentifierItemFromJson(
        Map<String, dynamic> json) =>
    SubscriptionGroupIdentifierItem(
      json['subscriptionGroupIdentifier'] as String,
      (json['lastTransactions'] as List<dynamic>)
          .map((e) => LastTransactionsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscriptionGroupIdentifierItemToJson(
        SubscriptionGroupIdentifierItem instance) =>
    <String, dynamic>{
      'subscriptionGroupIdentifier': instance.subscriptionGroupIdentifier,
      'lastTransactions': instance.lastTransactions,
    };

LastTransactionsItem _$LastTransactionsItemFromJson(
        Map<String, dynamic> json) =>
    LastTransactionsItem(
      json['originalTransactionId'] as String,
      json['status'] as int,
      json['signedRenewalInfo'] as String,
      json['signedTransactionInfo'] as String,
    );

Map<String, dynamic> _$LastTransactionsItemToJson(
        LastTransactionsItem instance) =>
    <String, dynamic>{
      'originalTransactionId': instance.originalTransactionId,
      'status': instance.status,
      'signedRenewalInfo': instance.signedRenewalInfo,
      'signedTransactionInfo': instance.signedTransactionInfo,
    };
