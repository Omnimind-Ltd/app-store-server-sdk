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
