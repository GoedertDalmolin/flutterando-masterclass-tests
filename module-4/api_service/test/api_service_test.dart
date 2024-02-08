import 'package:api_service/api_service.dart';
import 'package:api_service/product.dart';
import 'package:test/test.dart';
import 'package:uno/uno.dart';

void main() {
  test('deve retornar uma lista de product', () {
    final uno = Uno();
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
    final uno = Uno();
    final service = ApiService(uno: uno);

    expect(
      service.getProducts(),
      completion([]),
    );
  });
}
