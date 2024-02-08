import 'package:leitor_lcov/leitor_lcov.dart';
import 'package:test/test.dart';

void main() {
  test('deve pegar porcentagem de cobertura', () {
    final result = coverage('./coverage/lcv.info');

    expect(result, '100%');
  });
}
