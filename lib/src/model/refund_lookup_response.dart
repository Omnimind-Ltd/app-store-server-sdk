import 'package:json_annotation/json_annotation.dart';

part 'refund_lookup_response.g.dart';

/// A response that contains an array of signed JSON Web Signature (JWS) transactions.
@JsonSerializable()
class RefundLookupResponse {
  /// A list of JWS transactions, or an empty array if the customer has received
  /// no refunds in your app.
  final List<String> signedTransactions;

  RefundLookupResponse(this.signedTransactions);

  Map<String, dynamic> toJson() => _$RefundLookupResponseToJson(this);

  factory RefundLookupResponse.fromJson(Map<String, dynamic> json) =>
      _$RefundLookupResponseFromJson(json);

  @override
  String toString() {
    return 'RefundLookupResponse{signedTransactions: $signedTransactions}';
  }
}
