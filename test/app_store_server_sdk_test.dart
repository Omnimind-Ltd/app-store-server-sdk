import 'dart:io';

import 'package:app_store_server_sdk/app_store_server_sdk.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

import 'helper/mock_http_client.dart';
import 'helper/util.dart';

const privateKey = '''-----BEGIN PRIVATE KEY-----
MIGTAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBHkwdwIBAQQgxA52PJzAg3/Ebnxj
A/hnJiDTuuJEpEYhDvweAKB/ZhGgCgYIKoZIzj0DAQehRANCAAQbRjxshKKI8E4d
FBj7Hzxb2MzVYaThepSEiU4fgBbccmMau3ZCxpvCxuMTPHVtByQVhQlits1wymcs
aF6YE7ad
-----END PRIVATE KEY-----''';

void main() {
  late AppStoreServerAPI _api;

  setUp(() {
    var mockHttpClient = MockHttpClient(MockHttpClientHandler());

    mockHttpClient.addHandler(
        '/inApps/v1/subscriptions/1000000907113638', 'GET', (request) async {
      var json = await getJson('get_all_subscription_statuses.json');
      return Response(json, HttpStatus.created);
    });

    mockHttpClient.addHandler('/inApps/v1/history/1000000907113638', 'GET',
        (request) async {
      var json = await getJson('get_transaction_history.json');
      return Response(json, HttpStatus.created);
    });

    mockHttpClient.addHandler(
        '/inApps/v1/refund/lookup/1000000907113638', 'GET', (request) async {
      var json = await getJson('get_refund_history.json');
      return Response(json, HttpStatus.created);
    });

    var appStoreEnvironment = AppStoreEnvironment.sandbox(
      bundleId: 'bundleId',
      issuerId: 'issuerId',
      keyId: 'keyId',
      privateKey: privateKey,
    );
    _api = AppStoreServerAPI(
        AppStoreServerHttpClient(appStoreEnvironment, client: mockHttpClient));
  });

  test('Test get all subscription statuses', () async {
    var response = await _api.getAllSubscriptionStatuses('1000000907113638');
    expect(response.data.length, 1);
    expect(response.data.first.lastTransactions.length, 1);
    expect(response.data.first.lastTransactions.first.status, 2);

    expect(
        response.data.first.lastTransactions.first.renewalInfo
            .originalTransactionId,
        '1000000906235058');
    expect(
        response.data.first.lastTransactions.first.transactionInfo
            .originalTransactionId,
        '1000000906235058');
  });

  test('Test get transaction history', () async {
    var response = await _api.getTransactionHistory('1000000907113638');
    expect(response.signedTransactions.isNotEmpty, true);
  });

  test('Test get refund history', () async {
    var response = await _api.getRefundHistory('1000000907113638');
    expect(response.signedTransactions.isNotEmpty, true);
  });
}
