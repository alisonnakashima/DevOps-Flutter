import 'package:flutter_test/flutter_test.dart';

bool isValidTaskName(String title) {
  final invalidChars = RegExp(r'[@#!\$%¨&*]');
  return !invalidChars.hasMatch(title);
}

void main() {
  group('Validação do nome da tarefa', () {
    test('Deve retornar false para nomes com caracteres especiais', () {
      final invalidInputs = [
        'Tarefa@',
        'Comprar pão!',
        'Estudar #Flutter',
        'Lavar \$carro',
        'Trabalho & Escola',
        'Limpar*Quarto',
        'Verificar%Notas',
      ];

      for (final input in invalidInputs) {
        expect(isValidTaskName(input), false, reason: 'Falhou para: $input');
      }
    });

    test('Deve retornar true para nomes válidos', () {
      final validInputs = [
        'Ler livro',
        'Estudar Flutter',
        'Limpar a casa',
        'Reunião de projeto',
      ];

      for (final input in validInputs) {
        expect(isValidTaskName(input), true, reason: 'Falhou para: $input');
      }
    });
  });
}
