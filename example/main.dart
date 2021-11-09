import 'package:app_store_server_sdk/app_store_server_sdk.dart';

void main() async {
  String? token; // load existing token if available

  var appStoreEnvironment = AppStoreEnvironment.sandbox(
      bundleId: 'app_bundle_id',
      issuerId: 'issuer_id',
      keyId: 'private_key_id',
      privateKey: 'private_key');

  var appStoreHttpClient = AppStoreServerHttpClient(appStoreEnvironment,
      jwt: token, jwtTokenUpdatedCallback: (token) async {
    // Persist token for later re-use
  });

  var api = AppStoreServerAPI(appStoreHttpClient);

  try {
    var statusResponse =
        await api.getAllSubscriptionStatuses('1000000907113638');
    var historyResponse = await api.getTransactionHistory('1000000907113638');
    var refundLookupResponse = await api.getRefundHistory('1000000907113638');
  } on ApiException catch (e) {
    print('Error code ${e.error?.errorCode}');
    print('Error message ${e.error?.errorMessage}');
  }
}
