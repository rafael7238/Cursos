import 'package:flutter/material.dart';
import 'package:funcef_2/pages/Login/CircleButton.dart';
import 'package:funcef_2/pages/Login/LoginCustomTextField.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

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
                ),
              ),

            ],
          ),
        ]),
      ),
    );
  }
}
