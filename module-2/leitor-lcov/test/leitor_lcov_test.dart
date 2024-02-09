import 'package:leitor_lcov/leitor_lcov.dart';
import 'package:leitor_lcov/line_report.dart';
import 'package:test/test.dart';

void main() {
  test('deve pegar porcentagem de cobertura', () {
    final result = coverage('./coverage/lcov.info');

    expect(result, '88%');
  });

  test('deve calcular a percentagem em 50%', () {
    final result = calculatePercent([
      LineReport(
        sourceFile: '',
        lineFound: 20,
        lineHit: 10,
      ),
    ]);

    expect(result, 50);
  });
}
