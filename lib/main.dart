import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_vtech/page/home_page.dart';
import 'package:test_vtech/provider/Todos.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const String title = 'Todo list with Flutter';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          ),
          home: const HomePage(),
        ),
      );
}