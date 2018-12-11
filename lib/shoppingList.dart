import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shopping List"),
        ),
        body: ListView(),
      ),
    );
  }
}
