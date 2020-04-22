import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

TextEditingController _controllerCep = TextEditingController();

String _sresultado="Resultado";

  _recuperarCep() async {

    String cepDigitado = _controllerCep.text;
    String url = "https://viacep.com.br/ws/${cepDigitado}/json/";
    http.Response response;

    response = await http.get(url);
    
    Map<String,dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["logradouro"];
    
    print("Resposta: " + logradouro);
    print("Resposta: " + retorno.toString());
    print("Resposta: " + response.statusCode.toString());

    setState(() {
     _sresultado = retorno.toString(); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de Serviço Web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o CEP: Ex: 71741715"
              ),
              style: TextStyle(
                fontSize: 20
              ),
              controller: _controllerCep,
            ),
            RaisedButton(
              child: Text("Clique Aqui"),
              onPressed: _recuperarCep,
            ),
            Text(_sresultado)
          ],
        ),
      ),
    );
  }
}
