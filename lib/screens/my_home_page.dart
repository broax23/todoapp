import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_provider.dart';
import '../widgets/todo_action.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textFieldController = TextEditingController();
  String newTask = '';

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    Provider.of<TodoProvider>(context, listen: false).addTask(newTask);
    Navigator.pop(context);
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    Future<void> _showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Add a new Task"),
              content: TextField(
                autofocus: true,
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Add New Task"),
                onSubmitted: (_) => _submit(),
              ),
              actions: [
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40)),
                  child: const Text("Submit"),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              actionsAlignment: MainAxisAlignment.center,
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
      ),
      body: const TodoAction(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _showAddTextDialog();
        }),
        tooltip: "Add a todo",
        child: const Icon(Icons.add),
      ),
    );
  }
}
