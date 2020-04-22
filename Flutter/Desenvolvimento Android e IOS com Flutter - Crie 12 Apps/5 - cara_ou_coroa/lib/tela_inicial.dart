import 'dart:math';

import 'package:cara_ou_coroa/resuldado.dart';
import 'package:flutter/material.dart';

class tela_inicial extends StatefulWidget {
  @override
  _tela_inicialState createState() => _tela_inicialState();
}

class _tela_inicialState extends State<tela_inicial> {
  
  void _exibirResultado() {
    var itens = ["cara", "coroa"];
    var numero = Random().nextInt(itens.length);
    var resultado2 = itens[numero];

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => resultado(resul:resultado2),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset("images/logo.png"),
              GestureDetector(
                onTap: _exibirResultado,
                child: Image.asset("images/botao_jogar.png"),
              )
            ],
          ),
        ));
  }
}
