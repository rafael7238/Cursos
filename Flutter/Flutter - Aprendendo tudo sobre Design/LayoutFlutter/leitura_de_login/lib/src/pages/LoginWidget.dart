import 'package:flutter/material.dart';
import 'package:leitura_de_login/src/pages/login/LoginPage.dart';
import 'package:leitura_de_login/src/pages/login/LoginSignUpPage.dart';
import 'package:leitura_de_login/src/pages/login/LoginSigninPage.dart';
import 'package:leitura_de_login/src/pages/login/provider/providerPageController.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "images/monte.jpg",
            fit: BoxFit.cover,
          ),
          ProviderPageController(
            controller: _controller,
            child: PageView(
              controller: _controller,
              children: <Widget>[
                LoginSignUpPage(),
                LoginPage(),
                LoginSigninPage()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
