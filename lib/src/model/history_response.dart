import 'package:json_annotation/json_annotation.dart';

part 'history_response.g.dart';

/// A response that contains the customer’s transaction history for an app.
@JsonSerializable()
class HistoryResponse {
  /// The server environment in which you’re making the request, whether sandbox or production.
  final String environment;

  /// The app's identifier in the App Store.
  final String? appAppleId;

  /// The bundle identifier of the app.
  final String bundleId;

  /// A Boolean value that indicates whether the App Store has more transactions than are returned in this request.
  final bool hasMore;

  /// A token you use in a query to request the next set of transactions from the Get Transaction History endpoint.
  final String revision;

  /// An array of in-app purchase transactions for the customer, signed by Apple, in JSON Web Signature format.
  final List<String> signedTransactions;

  const HistoryResponse(this.environment, this.appAppleId, this.bundleId,
      this.hasMore, this.revision, this.signedTransactions);

  Map<String, dynamic> toJson() => _$HistoryResponseToJson(this);

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseFromJson(json);

  @override
  String toString() {
    return 'HistoryResponse{environment: $environment, appAppleId: $appAppleId,'
        ' bundleId: $bundleId, hasMore: $hasMore, revision: $revision,'
        ' signedTransactions: $signedTransactions}';
  }
}
