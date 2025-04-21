import 'package:flutter/material.dart';

void main() => runApp(TaskApp());

class Task {
  String title;
  bool isDone;
  Task({required this.title, this.isDone = false});
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      home: TaskListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<Task> _tasks = [];
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isValidTaskName(String title) {
    final invalidChars = RegExp(r'[@#!\$%¨&*]');
    return !invalidChars.hasMatch(title);
  }

  void _addTask(String title) {
    if (title.isEmpty || !_isValidTaskName(title)) return;
    setState(() {
      _tasks.add(Task(title: title));
    });
    _controller.clear();
  }

  void _toggleTask(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      _tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tarefas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Nova tarefa',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite o nome da tarefa';
                        }
                        if (!_isValidTaskName(value)) {
                          return 'Não utilize caracteres especiais (@, #, !, \$, %, ¨, &, *)';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addTask(_controller.text);
                      }
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (_) => _toggleTask(task),
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(task),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
