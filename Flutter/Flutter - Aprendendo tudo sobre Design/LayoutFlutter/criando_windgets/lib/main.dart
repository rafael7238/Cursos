import 'package:criando_windgets/customCircular_Avatar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: HomeWidget(),
  )));
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              print("RaiseClicado");
            },
            color: Colors.blue,
            child: Text("Clique Button"),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.insert_comment),
            onPressed: () {},
            label: Text("Clique Aqui"),
          ),
          CircleAvatar(
            child: Text(
              "J",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          customCircular(
            backgroundColor: Colors.blue,
            child: Text(
              "J",
              textAlign: TextAlign.center,
              //textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
