import 'package:flutter/material.dart';
import './shoppingList.dart';
import './taskList.dart';
import './cookingList.dart';
import './chat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        //'/': (context) => MyHome(),
        '/shoppingList': (context) => ShoppingList(),
        '/taskList': (context) => TaskList(),
        '/cookingList': (context) => CookingList(),
        '/chat': (context) => Chat(),
      },
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lists"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/chat');
        },
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
                      Navigator.pushNamed(context, '/shoppingList');
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
                      Navigator.pushNamed(context, '/taskList');
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
                      Navigator.pushNamed(context, '/cookingList');
                    },
                    leading: Icon(Icons.fastfood),
                    title: Text("Cooking list"),
                    subtitle: Text("Add/Remove recipes from your cooking list"),
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
    );
  }
}
