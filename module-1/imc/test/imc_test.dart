import 'package:imc/imc.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  // Executa Antes de Realizar Algum Teste.
  setUp(() {});

  // Executa depois de executar algum teste.
  tearDown(() {});

  // Ciclo de vida pra Switch inteira
  setUpAll(() {});

  // Ciclo de Vida pra Switch inteira
  tearDownAll(() {});

  test('Deve efetuar o calculo do IMC', () {
    final result = calcIMC(1.78, 64);

    expect(result, equals(20.199469763918696));
  });

  group('Exceções de Parâmetros', () {
    test('Deve lançar uma excessão se altura for menor que 1', () {
      expect(() => calcIMC(0, 64), throwsA(isA<Exception>()));
    });

    test('Deve lançar uma excessão se o peso for menor que 1', () {
      expect(() => calcIMC(1.78, 0), throwsA(isA<Exception>()));
    });
  });
}
