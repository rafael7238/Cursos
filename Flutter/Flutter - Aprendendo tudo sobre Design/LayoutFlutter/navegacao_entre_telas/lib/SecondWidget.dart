import 'package:flutter/material.dart';
import 'package:navegacao_entre_telas/Home.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second"),
      ),
      body: Center(
        child: RaisedButton(
          textColor: Colors.white,
          color: Colors.purple,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Back"),
        ),
      ),
    );
  }
}