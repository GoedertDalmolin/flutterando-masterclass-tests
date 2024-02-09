import 'dart:async';

import 'package:api_service/api_service.dart';
import 'package:api_service/product.dart';
import 'package:test/test.dart';

import 'package:uno/uno.dart';

class UnoMock implements Uno {
  final bool withError;

  const UnoMock({
    this.withError = false,
  });

  @override
  Future<Response> get(
    String url, {
    Duration? timeout,
    Map<String, String> params = const {},
    Map<String, String> headers = const {},
    ResponseType responseType = ResponseType.json,
    DownloadCallback? onDownloadProgress,
    ValidateCallback? validateStatus,
  }) async {
    if (withError) {
      throw UnoError('error');
    }

    return Response(
      headers: headers,
      request: Request(
        uri: Uri.base,
        method: '',
        headers: {},
        timeout: Duration.zero,
      ),
      status: 200,
      data: productListJson,
    );
  }

  @override
  noSuchMethod(Invocation invocation) {
    // TODO: implement noSuchMethod
    return super.noSuchMethod(invocation);
  }
}

void main() {
  test('deve retornar uma lista de product', () {
    final uno = UnoMock();
    final service = ApiService(uno: uno);

    expect(
      service.getProducts(),
      completion([
        Product(id: 1, title: 'title', price: 12.0),
        Product(id: 2, title: 'title2', price: 13.0),
      ]),
    );
  });

  test(
      'deve retornar uma lista de Product '
      'vazia quando houver uma falha', () {
    final uno = UnoMock(withError: true);
    final service = ApiService(uno: uno);

    expect(
      service.getProducts(),
      completion([]),
    );
  });
}

final productListJson = [
  {
    'id': 1,
    'title': 'title',
    'price': 12.0,
  },
  {
    'id': 2,
    'title': 'title2',
    'price': 13.0,
  },
];
