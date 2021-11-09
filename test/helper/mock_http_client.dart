import 'package:http/http.dart';
import 'package:http/testing.dart';

class MockHttpClient extends MockClient {
  final MockHttpClientHandler _mockHttpClientHandler;

  MockHttpClient(MockHttpClientHandler handler)
      : _mockHttpClientHandler = handler,
        super(handler.mockClientHandler) {}

  void addHandler(String path, String method, MockClientHandler handler) {
    _mockHttpClientHandler.addHandler(path, method, handler);
  }
}

class MockHttpClientHandler {
  MockHttpClientHandler();

  final Map<String, Map<String, Function>> handlers =
      <String, Map<String, MockClientHandler>>{};

  void addHandler(String path, String method, MockClientHandler handler) {
    handlers[path] ??= <String, MockClientHandler>{};
    handlers[path]![method] = handler;
  }

  Future<Response> mockClientHandler(Request request) async {
    var handler = handlers[request.url.path]![request.method];

    if (handler != null) {
      return await handler(request);
    }

    throw Exception(
        'No handler for request ${request.method} ${request.url.path}');
  }
}
