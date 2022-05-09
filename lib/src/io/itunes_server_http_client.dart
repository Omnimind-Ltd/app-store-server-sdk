import 'dart:convert';
import 'dart:html' if (dart.library.io) 'dart:io';

import 'package:app_store_server_sdk/src/exception/api_exception.dart';
import 'package:app_store_server_sdk/src/model/api_error.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

/// iTunes HTTP Client for making authenticated calls to iTunes API
class ITunesHttpClient extends http.BaseClient {
  final log = Logger('AppStoreServerSDK');

  final ITunesEnvironment appStoreEnvironment;

  final bool _loggingEnabled;

  late final http.Client _inner;

  ITunesHttpClient(
    this.appStoreEnvironment, {
    http.Client? client,
    bool loggingEnabled = false,
  }) : _loggingEnabled = loggingEnabled {
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
    headers ??= <String, String>{};

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
}

/// Live or sandbox environment
class ITunesEnvironment {
  /// Live or sandbox host
  final String host;

  /// The app specific shared secret
  final String password;

  ITunesEnvironment.sandbox({
    required this.password,
  }) : host = 'sandbox.itunes.apple.com';

  ITunesEnvironment.live({
    required this.password,
  }) : host = 'buy.itunes.apple.com';
}
