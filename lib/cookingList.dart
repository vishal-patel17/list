import 'package:flutter/material.dart';

class CookingList extends StatefulWidget {
  _CookingListState createState() => _CookingListState();
}

class _CookingListState extends State<CookingList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cooking List"),
        ),
        body: ListView(),
      ),
    );
  }
}
