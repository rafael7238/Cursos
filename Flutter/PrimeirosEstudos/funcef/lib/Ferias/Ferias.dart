import 'package:flutter/material.dart';

class Ferias extends StatefulWidget {
  @override
  _FeriasState createState() => _FeriasState();
}

Widget _dashInfo() {
  return Container(
      padding: EdgeInsets.all(10),
      child: Container(
          height: 110,
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text("Dias de Férias"),
                      Text("30 dias"),
                      Text("Inicio Das Férias"),
                      Text("01/11/1992"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text("Dias de Férias"),
                      Text("30 dias"),
                      Text("Inicio Das Férias"),
                      Text("01/11/1992"),
                    ],
                  ),
                ),
              ],
            ),
          )));
}

class _FeriasState extends State<Ferias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        _dashInfo(),
      ],
    ));
  }
}
