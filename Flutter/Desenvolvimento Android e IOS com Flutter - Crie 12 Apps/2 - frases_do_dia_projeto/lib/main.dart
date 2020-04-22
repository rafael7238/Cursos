import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = ["Frase 1", "Frase 2", "Frase 3", "Frase 4", "Frase 5"];
  var _fraseGerada = "Clique abaico para gerar uma frase!";
  int randomica;

  void _gerarFrase() {
    var randomico = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[randomico];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Frases do Dia"),
          backgroundColor: Colors.green,
        ),
        body: Container(
          //O Tamanho do Container é de acordo com o tamanho dos seus filhos.
          padding: EdgeInsets.all(16),
          width: double.infinity, //LArgula é 100% do disponível
          /*decoration:
              BoxDecoration(border: Border.all(width: 3, color: Colors.amber)),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Alinhamento
            crossAxisAlignment: CrossAxisAlignment.center, //Alinhamento
            children: <Widget>[
              Image.asset("images/logo.png"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              ),
              RaisedButton(
                onPressed: () {
                  _gerarFrase();
                },
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.green,
              ),
            ],
          ),
        ),
        bottomNavigationBar: null);
  }
}
