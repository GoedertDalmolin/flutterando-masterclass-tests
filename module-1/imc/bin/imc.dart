void main(List<String> arguments) {
  final result = calcIMC(1.78, 64);
  print(result);

  if (calcIMC(1.78, 64) == 20.199469763918696) {
    print('OK: , deve efetuar o calculo do IMC');
  } else {
    print('ERROR: Deve efeturar o calculo do IMC');
  }
}

double calcIMC(double altura, double peso) {
  if (altura < 1) {
    throw Exception('Altura não pode ser menor que 1');
  }

  if (peso < 1) {
    throw Exception('Peso não pode ser menor que 1');
  }

  return peso / (altura * altura);
}
