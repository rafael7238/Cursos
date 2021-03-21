import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const api = "https://api.hgbrasil.com/finance?format=json&key=7cf4be56";

void main() async {
  //Map<dynamic, dynamic> jsonResponse = await getData();
  // print(jsonResponse["results"]["currencies"]);
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.amber,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));
}

Future<Map> getData() async {
  http.Response resposta = await http.get(api);
  print(resposta.body);
  return json.decode(resposta.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dolar;
  double euro;

  TextEditingController dolarController = TextEditingController();
  TextEditingController euroController = TextEditingController();

  TextEditingController realController = TextEditingController();

  void _realChange(String valor) {
    double real = double.parse(valor);
    dolarController.text = (real / dolar).toStringAsFixed(4);
    euroController.text = (real / euro).toString();
  }

  void _dolarChange(String valor) {}

  void _euroChange(String valor) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(" \$ Conversor \$"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(
                child: Text(
                  "Carregando Dados...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25.0,
                  ),
                ),
              );
            default:
              if (snapshot.hasError) {
                return Text("Erro");
              } else {
                dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                return SingleChildScrollView(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 150.0,
                        color: Colors.amber,
                      ),
                      textCampos("Real", "R\$", realController, _realChange),
                      Divider(),
                      textCampos("Dólar", "US", dolarController, _dolarChange),
                      Divider(),
                      textCampos("Euro", "E", euroController, _euroChange),
                    ],
                  ),
                );
              }
          }
        },
        future: getData(),
      ),
    );
  }
}

Widget textCampos(String text, String prefix, TextEditingController controler,
    Function funcao) {
  return TextField(
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    controller: controler,
    style: TextStyle(
      color: Colors.amber,
      fontSize: 25.0,
    ),
    decoration: InputDecoration(
        labelText: "$text",
        labelStyle: TextStyle(
          color: Colors.amber,
        ),
        border: OutlineInputBorder(),
        prefixText: "$prefix"),
    onChanged: funcao,
  );
}
