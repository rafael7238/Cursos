import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:funcef/Login/CircleButton.dart';
import 'package:funcef/Login/LoginCustomTextField.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  _acessar() async {
    
    String _resultado = "0";
    _resultado="0";

    String url = "https://www.funcef.com.br/apl/ambienteempregados/Login.aspx/Logar";
    
    http.Response response;

    response = await http.post(url,
        headers: {"Content-type": "application/json; charset=UTF-8"},

        body: json
            .encode({"funcionario":true,"nome": "rafaelvasconcelos", "senha": 'Func@f201914'}));
    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["d"]["Success"].toString();

    setState(() {
      _resultado = logradouro;
    });

    if (logradouro=='false'){

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // retorna um objeto do tipo Dialog
          return AlertDialog(
            title: new Text(
              "Dados inválidos",
              style: TextStyle(color: Colors.red),
            ),
            content: new Text("Usuário ou senha Inválido"),
            actions: <Widget>[
              // define os botões na base do dialogo
              new FlatButton(
                child: new Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
    }

 /*   showDialog(
        context: context,
        builder: (BuildContext context) {
          // retorna um objeto do tipo Dialog
          return AlertDialog(
            title: new Text(
              "Dados inválidos",
              style: TextStyle(color: Colors.red),
            ),
            content: new Text("Usuário ou senha Inválido"),
            actions: <Widget>[
              // define os botões na base do dialogo
              new FlatButton(
                child: new Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });*/
    // Realiza as validações
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white.withOpacity(0.9),
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Image.asset(
                    "img/funcef.png",
                    height: 100,
                  )),
              Container(
                height: 50,
              ),
              CustomTextField(
                hint: "Usuário",
                controller: _controllerLogin,
              ),
              Container(
                height: 20,
              ),
              CustomTextField(
                hint: "Senha",
                password: true,
                controller: _controllerSenha,
              ),
              Container(
                height: 20,
              ),
              GestureDetector(
                child: CiclerButton(
                  label: "Acessar",
                  onTap: _acessar,
                ),
              ),
              
            ],
          ),
        ]),
      ),
    );
  }
}
