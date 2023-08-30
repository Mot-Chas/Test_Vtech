// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:test_vtech/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Best Morning Foods & Drinks to Start Your Day',
      description: '''- Water
- Green tea with lemon
- Oatmeal
- Berries
- Spinach
- Eggs
- Supergreens powder
- High-fiber bar''',
      id: '1',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan trip With Best Friend',
      description: '''- Kirirom
- Seam Reap
- Koh Sdach''',
      id: '2',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'The Most Beautiful Words in the English Language',
      id: '3',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Beautiful Words Related to Movement or Sound ',
      description: '''- balletic -> graceful motions
- deft -> skilled movements''',
      id: '4',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
