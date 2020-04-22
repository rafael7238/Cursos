import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bitcoin extends StatefulWidget {
  @override
  _BitcoinState createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {
  String _resultado = "0";

  void _recuperarPrecoBitcoin() async {
    String url = "https://blockchain.info/ticker";
    http.Response response;

    response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["BRL"]["buy"].toString();
    setState(() {
      _resultado = logradouro;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/bitcoin.png"),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(_resultado),
            ),
            RaisedButton(
              onPressed: _recuperarPrecoBitcoin,
              child: Text(
                "Atualizar",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
