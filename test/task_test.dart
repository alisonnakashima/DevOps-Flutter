// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_task_list/main.dart';

void main() {
  group('Task Model', () {
    test('Criação de tarefa deve definir isDone como false por padrão', () {
      final task = Task(title: 'Estudar Flutter');
      expect(task.isDone, false);
    });

    test('Alternar isDone deve funcionar corretamente', () {
      final task = Task(title: 'Exemplo');
      task.isDone = true;
      expect(task.isDone, true);
    });
  });
}