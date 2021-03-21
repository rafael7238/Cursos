import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Pode Entrar";

  @override
  Widget build(BuildContext context) {

    void _contador(int valor) {
      setState(() {
        _pessoa += valor;
        _pessoa < 0 ? _mensagem = "Mundo inverso" : _mensagem = "Pode Entrar";
      });
    }

    Widget flatButton(int cont) {
      return FlatButton(
        child: Text(
          cont > 0 ? "+$cont" : "$cont",
          style: TextStyle(fontSize: 40.0, color: Colors.white),
        ),
        onPressed: () {
          _contador(cont);
        },
      );
    }
    /* var flatButton = FlatButton(
      child: Text(
        "+1",
        style: TextStyle(fontSize: 40.0, color: Colors.white),
      ),
      onPressed: () {
        _contador(1);
      },
    );*/

    return Stack(
      children: [
        Image.asset(
          "img/restaurant.jpg",
          fit: BoxFit.cover,
          height: 100000.0,
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pessoa: $_pessoa",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: flatButton(1),
                  ),
                  Container(
                    child: flatButton(-1),
                  )
                ],
              ),
              Text(
                "$_mensagem",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0),
              )
            ],
          ),
        ),
      ],
    );
  }
}
