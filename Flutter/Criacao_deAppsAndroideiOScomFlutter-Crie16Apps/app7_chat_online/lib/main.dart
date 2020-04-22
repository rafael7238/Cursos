import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app7chatonline/chat_screen.dart';

Future<void> main() async {
  runApp(MyApp());
  //Firestore.instance.collection('col').document('z9Pyg9mHfwBuIaEQEAiq').setData({ 'Texto': 'Rafael3'});
  //Firestore.instance.collection('col').document().setData({ 'Texto': 'Rafae2'}); //Coloca um HASH no Documento

  //QuerySnapshot snapshot  = await Firestore.instance.collection('col').getDocuments();

  // snapshot.documents.forEach((element) {
  //   print(element.data);
  // });

  DocumentSnapshot snapshot = await Firestore.instance
      .collection('col')
      .document('z9Pyg9mHfwBuIaEQEAiq')
      .get();
  print(snapshot.data);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.blue
        )
      ),
      home: ChatScreen(),
    );
  }
}