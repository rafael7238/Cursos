import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Contador de Pessoa",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _mensagem = "Pode Entrar!";

  void _changePeople(int value) {
    setState(() {
      _people += value;
      if (_people <= 0) {
        _mensagem = "Mundo Invertido!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(children: [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        _changePeople(1);
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        _changePeople(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                        ),
                      )),
                )
              ],
            ),
            Text(
              _mensagem,
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ]),
    );
  }
}
