import 'package:flutter/material.dart';

class resultado extends StatefulWidget {
  String resul;
  resultado({this.resul});

  @override
  _resultadoState createState() => _resultadoState();
}

class _resultadoState extends State<resultado> {
  @override
  Widget build(BuildContext context) {
    print(widget.resul);
    var caminhoImagem = "images/moeda_cara.png";
    if (widget.resul == "coroa") caminhoImagem = "images/moeda_coroa.png";

    return Scaffold(
      //appBar: AppBar(),
        backgroundColor: Colors.green,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(caminhoImagem),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("images/botao_voltar.png"),
              )
            ],
          ),
        ));
  }
}
