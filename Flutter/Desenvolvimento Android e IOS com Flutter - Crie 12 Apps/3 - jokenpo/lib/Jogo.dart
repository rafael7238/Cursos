import 'dart:math';
import 'package:flutter/material.dart';


class Jogo extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _resultado = "Escolha uma opção abaixo";
  var opcoes = ["pedra", "papel", "tesoura"];
  var numeroRondomico;
  var perdeu;

  void _opcaoSelecionada(String escolhaUsuario) {
    numeroRondomico = Random().nextInt(3);

    setState(() {
      _imagemApp = AssetImage("images/" + opcoes[numeroRondomico] + ".png");
    });

//_imagemApp = AssetImage("images/" + opcoes[numeroRondomico] + ".png");

    if (escolhaUsuario == "pedra") {
      if (opcoes[numeroRondomico] == "pedra") {
        _resultado = "Você Empatou";
      } else if (opcoes[numeroRondomico] == "papel") {
        _resultado = "Você Perdeu";
      } else {
        _resultado = "Você Ganhou";
      }
    }

    if (escolhaUsuario == "papel") {
      if (opcoes[numeroRondomico] == "papel") {
        _resultado = "Você Empatou";
      } else if (opcoes[numeroRondomico] == "tesoura") {
        _resultado = "Você perdeu";
      } else {
        _resultado = "Você Ganhou";
      }
    }

    if (escolhaUsuario == "tesoura") {
      if (opcoes[numeroRondomico] == "tesoura") {
        _resultado = "Você Empatou";
      } else if (opcoes[numeroRondomico] == "pedra") {
        _resultado = "Você perdeu";
      } else {
        _resultado = "Você Ganhou";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("JokenPo")),
        body: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Alinhamento
            crossAxisAlignment: CrossAxisAlignment.center, //Alinhamento
            children: <Widget>[
              Text("Escolha do App:"),
              Image(image: this._imagemApp),
              Text(_resultado),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                      onTap: () => _opcaoSelecionada("pedra"),
                      child: Image.asset("images/pedra.png", height: 100)),
                  GestureDetector(
                      onTap: () => _opcaoSelecionada("papel"),
                      child: Image.asset("images/papel.png", height: 100)),
                  GestureDetector(
                      onTap: () => _opcaoSelecionada("tesoura"),
                      child: Image.asset("images/tesoura.png", height: 100)),
                ],
              )
            ],
          ),
        ));
  }
}
