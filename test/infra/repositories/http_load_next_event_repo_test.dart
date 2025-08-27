import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import '../../helpers/fakes.dart';

class HttpLoadNextEventRepository {
  final Client httpClient;

  HttpLoadNextEventRepository({required this.httpClient});

  Future<void> loadNextEvent({required String groupId}) async {
    httpClient.get(Uri());
  }
}

class SpyHttpClient implements Client {
  String? method;
  int callCount = 0;

  @override
  void close() {}

  @override
  Future<Response> delete(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    throw UnimplementedError();
  }

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    method = 'GET';
    callCount++;

    return Response('', 200);
  }

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<Response> patch(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    throw UnimplementedError();
  }

  @override
  Future<Response> post(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    throw UnimplementedError();
  }

  @override
  Future<Response> put(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    throw UnimplementedError();
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    throw UnimplementedError();
  }
}

void main() {
  test('should request with correct method', () async {
    // Arrange
    final SpyHttpClient httpClient = SpyHttpClient();
    final HttpLoadNextEventRepository sut = HttpLoadNextEventRepository(httpClient: httpClient);
    final String groupId = anyString();

    // Act
    await sut.loadNextEvent(groupId: groupId);

    // Assert
    expect(httpClient.method, 'GET');
    expect(httpClient.callCount, 1);
  });
}
