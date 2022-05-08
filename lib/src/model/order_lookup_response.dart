import 'package:json_annotation/json_annotation.dart';

part 'order_lookup_response.g.dart';

/// A response that includes the order lookup status and an array of signed
/// transactions for the in-app purchases in the order.
@JsonSerializable()
class OrderLookupResponse {
  /// A value that indicates whether the order ID in the request is valid for your app.
  final int? status;

  /// An array of in-app purchase transactions that are part of order, signed by
  /// Apple, in JSON Web Signature format.
  final List<String>? signedTransactions;

  const OrderLookupResponse({this.status, this.signedTransactions});

  Map<String, dynamic> toJson() => _$OrderLookupResponseToJson(this);

  factory OrderLookupResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderLookupResponseFromJson(json);

  @override
  String toString() {
    return 'OrderLookupResponse{status: $status, signedTransactions: $signedTransactions}';
  }
}
