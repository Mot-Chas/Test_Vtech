import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_vtech/provider/Todos.dart';
import 'package:test_vtech/widget/todo_widget.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    if (todos.isEmpty) {
      return const Center(
            child: Text(
              'No todos.',
              style: TextStyle(fontSize: 20),
            ),
          );
    } else {
      return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8, color: Colors.white10,),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
          );
    }
  }
}
