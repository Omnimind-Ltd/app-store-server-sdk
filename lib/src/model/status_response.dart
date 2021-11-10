import 'dart:convert';

import 'package:jose/jose.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status_response.g.dart';

/// A response that contains status information for all of a customer’s subscriptions in your app.
@JsonSerializable()
class StatusResponse {
  /// The server environment in which you’re making the request, whether sandbox or production.
  final String environment;

  /// The app's identifier in the App Store.
  final String? appAppleId;

  /// The bundle identifier of the app.
  final String bundleId;

  /// An array of subscription information, including signed transaction information and signed renewal information.
  final List<SubscriptionGroupIdentifierItem> data;

  StatusResponse(this.environment, this.appAppleId, this.bundleId, this.data);

  Map<String, dynamic> toJson() => _$StatusResponseToJson(this);

  factory StatusResponse.fromJson(Map<String, dynamic> json) =>
      _$StatusResponseFromJson(json);

  @override
  String toString() {
    return 'StatusResponse{environment: $environment, appAppleId: $appAppleId, '
        'bundleId: $bundleId, data: $data}';
  }
}

@JsonSerializable()
class SubscriptionGroupIdentifierItem {
  /// The subscription group identifier of the subscriptions in the lastTransactions array.
  final String subscriptionGroupIdentifier;

  /// An array of the most recent signed transaction information and signed renewal information for all subscriptions in the subscription group.
  final List<LastTransactionsItem> lastTransactions;

  const SubscriptionGroupIdentifierItem(
      this.subscriptionGroupIdentifier, this.lastTransactions);

  Map<String, dynamic> toJson() =>
      _$SubscriptionGroupIdentifierItemToJson(this);

  factory SubscriptionGroupIdentifierItem.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionGroupIdentifierItemFromJson(json);

  @override
  String toString() {
    return 'SubscriptionGroupIdentifierItem{'
        'subscriptionGroupIdentifier: $subscriptionGroupIdentifier, '
        'lastTransactions: $lastTransactions}';
  }
}

@JsonSerializable()
class LastTransactionsItem {
  /// The original transaction identifier of the subscription.
  final String originalTransactionId;

  /// The status of the subscription.
  final int status;

  /// The subscription renewal information signed by Apple, in JSON Web Signature (JWS) format.
  final String signedRenewalInfo;

  /// The transaction information signed by Apple, in JWS format.
  final String signedTransactionInfo;

  /// The decoded renewal information
  JWSRenewalInfoDecodedPayload get renewalInfo =>
      JWSRenewalInfoDecodedPayload.fromEncodedPayload(signedRenewalInfo);

  /// The decoded transaction information
  JWSTransactionDecodedPayload get transactionInfo =>
      JWSTransactionDecodedPayload.fromEncodedPayload(signedTransactionInfo);

  const LastTransactionsItem(this.originalTransactionId, this.status,
      this.signedRenewalInfo, this.signedTransactionInfo);

  Map<String, dynamic> toJson() => _$LastTransactionsItemToJson(this);

  factory LastTransactionsItem.fromJson(Map<String, dynamic> json) =>
      _$LastTransactionsItemFromJson(json);

  @override
  String toString() {
    return 'LastTransactionsItem{originalTransactionId: $originalTransactionId,'
        ' status: $status, signedRenewalInfo: $signedRenewalInfo,'
        ' signedTransactionInfo: $signedTransactionInfo}';
  }
}

/// A decoded payload containing subscription renewal information.
@JsonSerializable()
class JWSRenewalInfoDecodedPayload {
  /// The identifier of the product that renews at the next billing period.
  final String autoRenewProductId;

  /// The renewal status of the auto-renewable subscription.
  final int autoRenewStatus;

  /// The reason the subscription expired.
  final int? expirationIntent;

  /// The time when the grace period for subscription renewals expires.
  final String? gracePeriodExpiresDate;

  /// The Boolean value that indicates whether the App Store is attempting to automatically renew an expired subscription.
  final bool isInBillingRetryPeriod;

  /// The promo code or the promotional offer identifier.
  final String? offerIdentifier;

  /// The type of the promotional offer.
  final int? offerType;

  /// The transaction identifier of the original purchase associated with this transaction.
  final String originalTransactionId;

  /// The status indicating whether a customer has approved a subscription price increase.
  final int? priceIncreaseStatus;

  /// The unique identifier of the product.
  final String productId;

  /// The UNIX time, in milliseconds, that the App Store signed the JSON Web Signature data.
  final int signedDate;

  const JWSRenewalInfoDecodedPayload(
      this.autoRenewProductId,
      this.autoRenewStatus,
      this.expirationIntent,
      this.gracePeriodExpiresDate,
      this.isInBillingRetryPeriod,
      this.offerIdentifier,
      this.offerType,
      this.originalTransactionId,
      this.priceIncreaseStatus,
      this.productId,
      this.signedDate);

  factory JWSRenewalInfoDecodedPayload.fromEncodedPayload(String payload) {
    var jws = JsonWebSignature.fromCompactSerialization(payload);
    return JWSRenewalInfoDecodedPayload.fromJson(
        jsonDecode(jws.unverifiedPayload.stringContent));
  }

  Map<String, dynamic> toJson() => _$JWSRenewalInfoDecodedPayloadToJson(this);

  factory JWSRenewalInfoDecodedPayload.fromJson(Map<String, dynamic> json) =>
      _$JWSRenewalInfoDecodedPayloadFromJson(json);

  @override
  String toString() {
    return 'JWSRenewalInfoDecodedPayload{autoRenewProductId: $autoRenewProductId, '
        'autoRenewStatus: $autoRenewStatus, expirationIntent: $expirationIntent, '
        'gracePeriodExpiresDate: $gracePeriodExpiresDate, '
        'isInBillingRetryPeriod: $isInBillingRetryPeriod, '
        'offerIdentifier: $offerIdentifier, offerType: $offerType, '
        'originalTransactionId: $originalTransactionId, '
        'priceIncreaseStatus: $priceIncreaseStatus, productId: $productId, '
        'signedDate: $signedDate}';
  }
}

/// A decoded payload containing transaction information.
@JsonSerializable()
class JWSTransactionDecodedPayload {
  /// The UUID you created to identify the user’s in-app account when they made the purchase. If your app doesn’t provide an appAccountToken, this string is empty.
  final String? appAccountToken;

  /// The bundle identifier of the app.
  final String bundleId;

  /// The UNIX time, in milliseconds, the subscription expires or renews.
  final int expiresDate;

  /// A string that describes whether the transaction was purchased by the user, or is available to them through Family Sharing.
  final String? inAppOwnershipType;

  /// The Boolean value that indicates whether the user upgraded to another subscription.
  final bool? isUpgraded;

  /// The identifier that contains the promo code or the promotional offer identifier.
  final String? offerIdentifier;

  /// A value that represents the promotional offer type.
  final String? offerType;

  /// The UNIX time, in milliseconds, that represents the purchase date of the original transaction identifier.
  final int originalPurchaseDate;

  /// The transaction identifier of the original purchase.
  final String originalTransactionId;

  /// The unique identifier of the product.
  final String productId;

  /// The UNIX time, in milliseconds, that the App Store charged the user’s account for a purchase, restored product, subscription, or subscription renewal after a lapse.
  final int purchaseDate;

  /// The number of consumable products the user purchased.
  final int? quantity;

  /// The UNIX time, in milliseconds, that Apple Support refunded a transaction.
  final int? revocationDate;

  /// The UNIX time, in milliseconds, that the App Store signed the JSON Web Signature data.
  final int signedDate;

  /// The identifier of the subscription group the subscription belongs to.
  final String subscriptionGroupIdentifier;

  /// The unique identifier of the transaction.
  final String transactionId;

  /// The type of the in-app purchase.
  final String type;

  /// A unique ID that identifies subscription purchase events across devices, including subscription renewals.
  final String? webOrderLineItemId;

  JWSTransactionDecodedPayload(
      this.appAccountToken,
      this.bundleId,
      this.expiresDate,
      this.inAppOwnershipType,
      this.isUpgraded,
      this.offerIdentifier,
      this.offerType,
      this.originalPurchaseDate,
      this.originalTransactionId,
      this.productId,
      this.purchaseDate,
      this.quantity,
      this.revocationDate,
      this.signedDate,
      this.subscriptionGroupIdentifier,
      this.transactionId,
      this.type,
      this.webOrderLineItemId);

  factory JWSTransactionDecodedPayload.fromEncodedPayload(String payload) {
    var jws = JsonWebSignature.fromCompactSerialization(payload);
    return JWSTransactionDecodedPayload.fromJson(
        jsonDecode(jws.unverifiedPayload.stringContent));
  }

  Map<String, dynamic> toJson() => _$JWSTransactionDecodedPayloadToJson(this);

  factory JWSTransactionDecodedPayload.fromJson(Map<String, dynamic> json) =>
      _$JWSTransactionDecodedPayloadFromJson(json);

  @override
  String toString() {
    return 'JWSTransactionDecodedPayload{appAccountToken: $appAccountToken, bundleId: $bundleId, '
        'expiresDate: $expiresDate, inAppOwnershipType: $inAppOwnershipType, '
        'isUpgraded: $isUpgraded, offerIdentifier: $offerIdentifier, '
        'offerType: $offerType, originalPurchaseDate: $originalPurchaseDate, '
        'originalTransactionId: $originalTransactionId, productId: $productId, '
        'purchaseDate: $purchaseDate, quantity: $quantity, revocationDate: $revocationDate, '
        'signedDate: $signedDate, subscriptionGroupIdentifier: $subscriptionGroupIdentifier, '
        'transactionId: $transactionId, type: $type, webOrderLineItemId: $webOrderLineItemId}';
  }
}
