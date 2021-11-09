import 'dart:convert';

import 'package:app_store_server_sdk/app_store_server_sdk.dart';
import 'package:app_store_server_sdk/src/model/consumption_request.dart';
import 'package:app_store_server_sdk/src/model/extend_renewal_date.dart';
import 'package:app_store_server_sdk/src/model/order_lookup_response.dart';
import 'package:app_store_server_sdk/src/model/refund_lookup_response.dart';
import 'package:app_store_server_sdk/src/model/status_response.dart';

import 'model/history_response.dart';

/// Manage your customers’ App Store transactions from your server.
class AppStoreServerAPI {
  final AppStoreServerHttpClient _appStoreServerHttpClient;

  AppStoreServerAPI(AppStoreServerHttpClient appStoreServerHttpClient)
      : _appStoreServerHttpClient = appStoreServerHttpClient;

  /// Get a customer’s in-app purchase transaction history for your app.
  ///
  /// Param: originalTransactionId - The original transaction identifier of any
  /// transaction belonging to the customer.
  Future<HistoryResponse> getTransactionHistory(String originalTransactionId,
      {String? revision}) async {
    var url = _appStoreServerHttpClient.getUrl(
        '/inApps/v1/history/$originalTransactionId',
        queryParameters: revision != null ? {'revision': revision} : null);

    var response = await _appStoreServerHttpClient.get(url);
    return HistoryResponse.fromJson(jsonDecode(response.body));
  }

  /// Get the statuses for all of a customer’s subscriptions in your app.
  ///
  /// Param: originalTransactionId - The original transaction identifier of any
  /// transaction belonging to the customer.
  Future<StatusResponse> getAllSubscriptionStatuses(
      String originalTransactionId) async {
    var url = _appStoreServerHttpClient
        .getUrl('/inApps/v1/subscriptions/$originalTransactionId');

    var response = await _appStoreServerHttpClient.get(url);
    return StatusResponse.fromJson(jsonDecode(response.body));
  }

  /// Send consumption information about a consumable in-app purchase to the App Store,
  /// after your server receives a consumption request notification.
  ///
  /// Param: originalTransactionId - The original transaction identifier for which
  /// you’re providing consumption information. You receive this identifier in the
  /// CONSUMPTION_REQUEST notification the App Store sends to your server.
  Future<void> sendConsumptionInformation(
      String originalTransactionId, ConsumptionRequest request) async {
    var url = _appStoreServerHttpClient
        .getUrl('/inApps/v1/transactions/consumption/$originalTransactionId');

    await _appStoreServerHttpClient.put(url,
        body: jsonEncode(request.toJson()));
  }

  /// Get a customer’s in-app purchases from a receipt using the order ID.
  ///
  /// Param: orderId - The order ID for in-app purchases that belong to the customer.
  Future<OrderLookupResponse> lookUpOrderId(String orderId) async {
    var url = _appStoreServerHttpClient.getUrl('/inApps/v1/lookup/$orderId');

    var response = await _appStoreServerHttpClient.get(url);
    return OrderLookupResponse.fromJson(jsonDecode(response.body));
  }

  /// Get a list of all refunded in-app purchases in your app for a customer.
  ///
  /// Param: originalTransactionId - The original transaction identifier of any
  /// transaction belonging to the customer.
  Future<RefundLookupResponse> getRefundHistory(
      String originalTransactionId) async {
    var url = _appStoreServerHttpClient
        .getUrl('/inApps/v1/refund/lookup/$originalTransactionId');

    var response = await _appStoreServerHttpClient.get(url);
    return RefundLookupResponse.fromJson(jsonDecode(response.body));
  }

  /// Extend the renewal date of a customer’s active subscription using the original transaction identifier.
  ///
  /// Param: originalTransactionId - The original transaction identifier of the subscription receiving a renewal date extension.
  Future<ExtendRenewalDateResponse> extendSubscriptionRenewalDate(
      String originalTransactionId, ExtendRenewalDateRequest request) async {
    var url = _appStoreServerHttpClient
        .getUrl('/inApps/v1/subscriptions/extend/$originalTransactionId');

    var response = await _appStoreServerHttpClient.put(url,
        body: jsonEncode(request.toJson()));
    return ExtendRenewalDateResponse.fromJson(jsonDecode(response.body));
  }
}
