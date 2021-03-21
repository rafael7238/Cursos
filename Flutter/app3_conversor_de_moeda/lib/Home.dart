import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';

import 'FormComp.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double real;
  double dolar;
  double euro;

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  void RealChange(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void DolarChange(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    var _dolar = double.parse(text);
    realController.text = (_dolar * this.dolar).toStringAsFixed(2);
    euroController.text = ((_dolar * this.dolar) / euro).toStringAsFixed(2);
  }

  void EuroChange(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    var _euro = double.parse(text);
    realController.text = (_euro * this.euro).toStringAsFixed(2);
    dolarController.text = ((_euro * this.euro) / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: chamarFuncao(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  "Carregando dados",
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Errro ao carregar os dados",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                return SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 150.0,
                        color: Colors.amber,
                      ),
                      inputDecoration("Reais", "R", realController, RealChange),
                      Divider(),
                      inputDecoration(
                          "Dolares", "UA", dolarController, DolarChange),
                      Divider(),
                      inputDecoration("Euro", "EU", euroController, EuroChange),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Future<Map> chamarFuncao() async {
  Uri request = Uri.parse("https://api.hgbrasil.com/finance?key=7cf4be56");
  http.Response responde = await http.get(request);
  var jsons = json.decode(responde.body);
  var results = jsons["results"]["currencies"]["USD"];
  //print(responde.body);
  //print(jsons);
  return jsons;
}