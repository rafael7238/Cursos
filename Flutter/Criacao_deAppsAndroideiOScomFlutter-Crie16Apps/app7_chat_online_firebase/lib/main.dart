import 'package:app7_chat_online_firebase/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(iconTheme: IconThemeData(color: Colors.blue)),
  ));

  /* Firestore.instance
      .collection("mensagens")
      .document("5pIIACk9hUi9qNwCAJtK")
      .setData({"texto": "Oi, tudo bem?", "from": "Não Lida", "read": false});*/

  QuerySnapshot t =
      await Firestore.instance.collection("mensagens").getDocuments();
  t.documents.forEach((element) {
    print("${element.documentID} - ${element.data}");
  });
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChatScreen();
  }
}
