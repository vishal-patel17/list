import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Task List"),
        ),
        body: ListView(),
      ),
    );
  }
}
