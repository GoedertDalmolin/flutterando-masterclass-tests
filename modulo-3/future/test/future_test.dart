import 'package:future/future.dart';
import 'package:test/test.dart';

void main() {
  test('deve completar a requisição trazendo uma lista de nomes', () {
    final future = getFutureList();

    expect(future, completion(isA<List<String>>()));
  });
}
