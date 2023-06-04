import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';

import './screens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => TodoProvider()),
      child: MaterialApp(
        title: 'ToDo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
