// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_task_list/main.dart';

void main() {
  test('Teste erro proposital para falha na esteira', () {
    final task = Task(title: 'Estudar Flutter');

    // Espera que a tarefa esteja marcada como concluída, mas ela não está
    expect(task.isDone, isTrue); // FALHA
  });
}