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

  // Triple A padrão de teste
  // arrange - preparação dos testes - variaveis e ambiente
  // act - Execução do teste
  // assert - resultado esperado após act
  test('Deve efetuar o calculo do IMC', () {
    // arrange
    final peso = 64.0;
    final altura = 1.78;

    // act
    final result = calcIMC(altura, peso);

    // assert
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
