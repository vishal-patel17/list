import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Start Chatting"),
        ),
        body: ListView(),
      ),
    );
  }
}
