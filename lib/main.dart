import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lists"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.chat),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.green,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        //debugPrint("Clicked!");
                      },
                      leading: Icon(Icons.shopping_cart),
                      title: Text("Shopping list"),
                      subtitle: Text("Add/Remove items from the shopping list"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        //debugPrint("Clicked!");
                      },
                      leading: Icon(Icons.today),
                      title: Text("Task list"),
                      subtitle: Text("Add/Remove your daily tasks"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.yellow,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        //debugPrint("Clicked!");
                      },
                      leading: Icon(Icons.fastfood),
                      title: Text("Cooking list"),
                      subtitle:
                          Text("Add/Remove recipes from your cooking list"),
                    ),
                  ],
                ),
              ),
            ),
             SizedBox(
              height: 20.0,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text("Login"),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Signup"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
