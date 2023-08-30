import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_vtech/model/todo.dart';
import 'package:test_vtech/page/edit_page.dart';
import 'package:test_vtech/provider/Todos.dart';
import 'package:test_vtech/utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            //alignment: Alignment.center,
            constraints: const BoxConstraints(
              maxWidth: double.maxFinite,
              maxHeight: double.infinity,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 224, 221, 221),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 8,
                  color: Colors.black26,
                )
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Checkbox(
                  activeColor: Colors.blue[900],
                  checkColor: Colors.white,
                  value: todo.isDone,
                  onChanged: (_) {
                    final provider =
                        Provider.of<TodosProvider>(context, listen: false);
                    final isDone = provider.toggleTodoStatus(todo);

                    Utils.showSnackBar(
                      context,
                      isDone ? 'Task completed' : 'Task marked incomplete',
                    );
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                          fontSize: 22),
                    ),
                    if (todo.description.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Text(todo.description,
                            style: const TextStyle(
                              fontSize: 20, //height: 11.5),)
                            )),
                      ),
                  ],
                )),
                InkWell(
                  child: const Icon(Icons.edit),
                  onTap: () => editTodo(context, todo),
                ),
                const SizedBox(
                  width: 25,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    child: const Icon(Icons.delete),
                    onTap: () => DeleteTodo(context, todo),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // ignore: non_constant_identifier_names
  void DeleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Delete The Task');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );
}
