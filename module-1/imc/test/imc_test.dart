import 'package:imc/imc.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Testes de calculo IMC', () {
    test('Deve efetuar o calculo do IMC', () {
      final result = calcIMC(1.78, 64);

      expect(result, equals(20.199469763918696));
    });

    test('Deve lançar uma excessão se altura for menor que 1', () {
      expect(() => calcIMC(0, 64), throwsA(isA<Exception>()));
    });

    test('Deve lançar uma excessão se o peso for menor que 1', () {
      expect(() => calcIMC(1.78, 0), throwsA(isA<Exception>()));
    });
  });
}
