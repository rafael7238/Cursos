import 'package:flutter/material.dart';
import 'package:navegacao_entre_telas/SecondWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator"),
      ),
      body: Center(
        child: RaisedButton(
          textColor: Colors.white,
          color: Colors.purple,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return Second();
            }));
          },
          child: Text("Next Widget"),
        ),
      ),
    );
  }
}
