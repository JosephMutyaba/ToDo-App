import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/dbase.dart';
import 'package:todo_app/utilities/Dialog.dart';
import 'package:todo_app/utilities/container.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final _controller = TextEditingController();

  TodaDatabase dbase = TodaDatabase();

  final _box = Hive.box("mydb");

  // List todosList = [
  //   [true, "First Task"],
  //   [false, "Last Task"],
  // ];
  @override
  void initState() {
    super.initState();
    if (_box.get("TODOLIST") == null) {
      dbase.createInitialData();
    } else {
      dbase.readData();
    }
  }

  //checked condition
  void checkedCondition(bool? value, int index) {
    setState(() {
      dbase.todosList[index][0] = !dbase.todosList[index][0];
    });
    dbase.updateBox();
  }

  void savingTask() {
    setState(() {
      dbase.todosList.add([false, _controller.text]);
      _controller.clear();
    });
    dbase.updateBox();
    Navigator.of(context).pop();
  }

  //new task fron dialog
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DailogBox(onSave: savingTask, controller: _controller);
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      dbase.todosList.removeAt(index);
    });
    dbase.updateBox();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TO DO"),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: dbase.todosList.length,
          itemBuilder: (context, index) {
            return ContainerSingled(
              checkedCondition: dbase.todosList[index][0],
              todotitle: dbase.todosList[index][1],
              onChanged: (val) => checkedCondition(val, index),
              onDelete: (context) => deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}
