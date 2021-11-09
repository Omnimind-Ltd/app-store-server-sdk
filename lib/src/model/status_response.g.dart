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

JWSRenewalInfoDecodedPayload _$JWSRenewalInfoDecodedPayloadFromJson(
        Map<String, dynamic> json) =>
    JWSRenewalInfoDecodedPayload(
      json['autoRenewProductId'] as String,
      json['autoRenewStatus'] as int,
      json['expirationIntent'] as int,
      json['gracePeriodExpiresDate'] as String?,
      json['isInBillingRetryPeriod'] as bool,
      json['offerIdentifier'] as String?,
      json['offerType'] as int?,
      json['originalTransactionId'] as String,
      json['priceIncreaseStatus'] as int?,
      json['productId'] as String,
      json['signedDate'] as int,
    );

Map<String, dynamic> _$JWSRenewalInfoDecodedPayloadToJson(
    JWSRenewalInfoDecodedPayload instance) {
  final val = <String, dynamic>{
    'autoRenewProductId': instance.autoRenewProductId,
    'autoRenewStatus': instance.autoRenewStatus,
    'expirationIntent': instance.expirationIntent,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('gracePeriodExpiresDate', instance.gracePeriodExpiresDate);
  val['isInBillingRetryPeriod'] = instance.isInBillingRetryPeriod;
  writeNotNull('offerIdentifier', instance.offerIdentifier);
  writeNotNull('offerType', instance.offerType);
  val['originalTransactionId'] = instance.originalTransactionId;
  writeNotNull('priceIncreaseStatus', instance.priceIncreaseStatus);
  val['productId'] = instance.productId;
  val['signedDate'] = instance.signedDate;
  return val;
}

JWSTransactionDecodedPayload _$JWSTransactionDecodedPayloadFromJson(
        Map<String, dynamic> json) =>
    JWSTransactionDecodedPayload(
      json['appAccountToken'] as String?,
      json['bundleId'] as String,
      json['expiresDate'] as int,
      json['inAppOwnershipType'] as String,
      json['isUpgraded'] as bool?,
      json['offerIdentifier'] as String?,
      json['offerType'] as String?,
      json['originalPurchaseDate'] as int,
      json['originalTransactionId'] as String,
      json['productId'] as String,
      json['purchaseDate'] as int,
      json['quantity'] as int,
      json['revocationDate'] as int?,
      json['signedDate'] as int,
      json['subscriptionGroupIdentifier'] as String,
      json['transactionId'] as String,
      json['type'] as String,
      json['webOrderLineItemId'] as String,
    );

Map<String, dynamic> _$JWSTransactionDecodedPayloadToJson(
    JWSTransactionDecodedPayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appAccountToken', instance.appAccountToken);
  val['bundleId'] = instance.bundleId;
  val['expiresDate'] = instance.expiresDate;
  val['inAppOwnershipType'] = instance.inAppOwnershipType;
  writeNotNull('isUpgraded', instance.isUpgraded);
  writeNotNull('offerIdentifier', instance.offerIdentifier);
  writeNotNull('offerType', instance.offerType);
  val['originalPurchaseDate'] = instance.originalPurchaseDate;
  val['originalTransactionId'] = instance.originalTransactionId;
  val['productId'] = instance.productId;
  val['purchaseDate'] = instance.purchaseDate;
  val['quantity'] = instance.quantity;
  writeNotNull('revocationDate', instance.revocationDate);
  val['signedDate'] = instance.signedDate;
  val['subscriptionGroupIdentifier'] = instance.subscriptionGroupIdentifier;
  val['transactionId'] = instance.transactionId;
  val['type'] = instance.type;
  val['webOrderLineItemId'] = instance.webOrderLineItemId;
  return val;
}
