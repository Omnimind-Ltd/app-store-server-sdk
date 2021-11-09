import 'dart:convert';
import 'dart:html' if (dart.library.io) 'dart:io';

import 'package:app_store_server_sdk/src/exception/api_exception.dart';
import 'package:app_store_server_sdk/src/model/api_error.dart';
import 'package:http/http.dart' as http;
import 'package:jose/jose.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

/// App store HTTP Client for making authenticated calls to App Store Server API
class AppStoreServerHttpClient extends http.BaseClient {
  final log = Logger('AppStoreServerSDK');

  final AppStoreEnvironment appStoreEnvironment;

  final bool _loggingEnabled;

  late final http.Client _inner;

  String? jwt;

  final Function(String)? _jwtTokenUpdatedCallback;

  AppStoreServerHttpClient(this.appStoreEnvironment,
      {http.Client? client,
      String? jwt,
      Function(String)? jwtTokenUpdatedCallback,
      bool loggingEnabled = false})
      : _jwtTokenUpdatedCallback = jwtTokenUpdatedCallback,
        _loggingEnabled = loggingEnabled {
    _inner = client ?? http.Client();

    if (_loggingEnabled) {
      log.onRecord.listen((record) {
        print('${record.level.name}: ${record.time}: ${record.message}');
      });
    }
  }

  /// Creates URL with the given path and currently configured environment
  Uri getUrl(String path, {Map<String, dynamic>? queryParameters}) {
    if (queryParameters != null) {
      for (var key in queryParameters.keys.toList(growable: false)) {
        if (queryParameters[key] == null) {
          queryParameters.remove(key);
        }
      }
    }

    return Uri.https(appStoreEnvironment.host, path, queryParameters);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request);
  }

  @override
  Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    return _makeRequest('GET', url, headers: headers);
  }

  @override
  Future<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _makeRequest('POST', url,
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _makeRequest('PUT', url,
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _makeRequest('PATCH', url,
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _makeRequest('DELETE', url,
        headers: headers, body: body, encoding: encoding);
  }

  Future<http.Response> _makeRequest(
    String method,
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    if (jwt == null || !(await _verifyJWT(jwt!))) {
      jwt = _generateJWT();
    }

    headers ??= <String, String>{};
    headers['Authorization'] = 'Bearer $jwt';

    if (body != null) {
      headers['Content-Type'] ??= 'application/json';
    }

    if (_loggingEnabled) {
      log.info('Request: $method $url');
      log.info('Headers: $headers');
      log.info('Body: $body');
    }

    late http.Response response;

    switch (method) {
      case 'HEAD':
        response = await super.head(url, headers: headers);
        break;
      case 'GET':
        response = await super.get(url, headers: headers);
        break;
      case 'POST':
        response = await super
            .post(url, headers: headers, body: body, encoding: encoding);
        break;
      case 'PUT':
        response = await super
            .put(url, headers: headers, body: body, encoding: encoding);
        break;
      case 'PATCH':
        response = await super
            .patch(url, headers: headers, body: body, encoding: encoding);
        break;
      case 'DELETE':
        response = await super
            .delete(url, headers: headers, body: body, encoding: encoding);
        break;
    }

    if (_loggingEnabled) {
      log.info('Response: ${response.statusCode}');
      log.info('Headers: $headers');
      log.info('Body: ${response.body}');
    }

    if (response.statusCode >= HttpStatus.ok &&
        response.statusCode <= HttpStatus.noContent) {
      return response;
    } else if (response.body.contains('errorCode')) {
      var apiError = ApiError.fromJson(jsonDecode(response.body));
      throw ApiException(response.statusCode, error: apiError);
    }

    throw ApiException(response.statusCode, response: response.body);
  }

  Future<bool> _verifyJWT(String key) async {
    var token = JsonWebToken.unverified(key);
    var webKey = new JsonWebKey.fromPem(appStoreEnvironment.privateKey,
        keyId: appStoreEnvironment.keyId);
    var keyStore = JsonWebKeyStore()..addKey(webKey);
    var valid = await token.verify(keyStore);

    if (DateTime.now().isAfter(token.claims.expiry ?? DateTime.now())) {
      return false;
    }

    return valid;
  }

  String _generateJWT() {
    var time = DateTime.now();

    var claims = JsonWebTokenClaims.fromJson({
      'iat': (time.millisecondsSinceEpoch / 1000).floor(),
      'exp':
          (time.add(Duration(hours: 1)).millisecondsSinceEpoch / 1000).floor(),
      'iss': appStoreEnvironment.issuerId,
      'aud': 'appstoreconnect-v1',
      'nonce': Uuid().v4(),
      'bid': appStoreEnvironment.bundleId,
    });

    var builder = JsonWebSignatureBuilder();
    builder.setProtectedHeader('kid', appStoreEnvironment.keyId);
    builder.setProtectedHeader('typ', 'JWT');
    builder.jsonContent = claims.toJson();

    builder.addRecipient(
        JsonWebKey.fromPem(appStoreEnvironment.privateKey,
            keyId: appStoreEnvironment.keyId),
        algorithm: "ES256");

    var jws = builder.build();
    var jwtToken = jws.toCompactSerialization();

    if (_jwtTokenUpdatedCallback != null) {
      _jwtTokenUpdatedCallback!(jwtToken);
    }

    return jwtToken;
  }
}

/// Live or sandbox environment
class AppStoreEnvironment {
  /// Live or sandbox host
  final String host;

  /// The app bundle id
  final String bundleId;

  /// The issuer id
  final String issuerId;

  /// The private key id
  final String keyId;

  /// The private key
  final String privateKey;

  AppStoreEnvironment.sandbox({
    required this.bundleId,
    required this.issuerId,
    required this.keyId,
    required this.privateKey,
  }) : host = 'api.storekit-sandbox.itunes.apple.com';

  AppStoreEnvironment.live({
    required this.bundleId,
    required this.issuerId,
    required this.keyId,
    required this.privateKey,
  }) : host = 'api.storekit.itunes.apple.com';
}
