import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class ShoppingList extends StatefulWidget {
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {

  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  void initState() { 
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message){
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message){
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message){
        print('on launch $message');
      },
    );
    // _firebaseMessaging.getToken().then((token){
    //   print(token);
    // });
    
  }

  String item;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shopping List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Enter an item to purchase"),
                    content: TextField(
                      autofocus: true,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.text,
                      onChanged: (String value) {
                        setState(() {
                          this.item = value;
                        });
                      },
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          Firestore.instance
                              .runTransaction((Transaction transaction) async {
                            CollectionReference reference =
                                Firestore.instance.collection('shopping_list');
                            await reference.add({"name": item});
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Icon(Icons.cancel),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
          },
          child: Icon(Icons.add_shopping_cart),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('shopping_list').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                return ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                        "Purchased " + document['name'] + " ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Icon(Icons.done),
                                        onPressed: () {
                                          Firestore.instance
                                              .collection('shopping_list')
                                              .document(document.documentID)
                                              .delete();

                                          Navigator.pop(context);
                                        },
                                      ),
                                      FlatButton(
                                        child: Icon(Icons.cancel),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          title: Text(
                            document['name'],
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
            }
          },
        ),
      ),
    );
  }
}
