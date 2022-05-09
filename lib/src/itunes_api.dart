import 'dart:convert';

import 'io/itunes_server_http_client.dart';
import 'model/verify_receipt_request.dart';
import 'model/verify_receipt_response.dart';

/// iTunes API
class iTunesApi {
  final ITunesHttpClient _iTunesHttpClient;

  iTunesApi(ITunesHttpClient iTunesHttpClient)
      : _iTunesHttpClient = iTunesHttpClient;

  /// Send a receipt to the App Store for verification.
  ///
  /// Param: password - Your app’s shared secret, which is a hexadecimal string.
  /// For more information about the shared secret, see Generate a Receipt Validation Code.
  ///
  /// Param: receipt-data - The Base64-encoded receipt data.
  ///
  /// Param: exclude-old-transactions - Set this value to true for the response
  /// to include only the latest renewal transaction for any subscriptions. Use
  /// this field only for app receipts that contain auto-renewable subscriptions.
  Future<VerifyReceiptResponse> verifyReceipt({
    required String password,
    required String receiptData,
    bool excludeOldTransactions = true,
  }) async {
    var request = VerifyReceiptRequest(
        password: password,
        receiptData: receiptData,
        excludeOldTransactions: excludeOldTransactions);

    var url = _iTunesHttpClient.getUrl('/verifyReceipt');

    var response =
        await _iTunesHttpClient.post(url, body: jsonEncode(request.toJson()));

    return VerifyReceiptResponse.fromJson(jsonDecode(response.body));
  }
}
