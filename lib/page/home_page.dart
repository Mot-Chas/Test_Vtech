import 'package:flutter/material.dart';
import 'package:border_bottom_navigation_bar/border_bottom_navigation_bar.dart';
import 'package:test_vtech/main.dart';
import 'package:test_vtech/widget/add_Todo_list.dart';
import 'package:test_vtech/widget/completed_list_widget.dart';
import 'package:test_vtech/widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoList(),
      const CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          MyApp.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
      ),
      bottomNavigationBar: BorderBottomNavigationBar(
        height: 53,
        borderRadiusValue: 25,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        selectedLabelColor: Colors.white,
        unselectedLabelColor: const Color.fromARGB(137, 75, 74, 74),
        selectedBackgroundColor: Colors.blue[900]!,
        unselectedBackgroundColor: const Color.fromARGB(137, 87, 87, 87),
        unselectedIconColor: Colors.black,
        selectedIconColor: Colors.white,
        customBottomNavItems: [
          BorderBottomNavigationItems(
            icon: Icons.list,
          ),
          BorderBottomNavigationItems(
            icon: Icons.done,
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () => showDialog(
            builder: (context) => AddTodolistWidget(),
            context: context,
            barrierDismissible: false),
        backgroundColor: Colors.blue[900]!,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
