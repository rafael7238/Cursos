import 'package:flutter/material.dart';
import 'package:leitura_de_login/src/pages/login/provider/providerPageController.dart';
import 'package:leitura_de_login/src/pages/login/widgets/CircleButton.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    PageController controller = ProviderPageController.of(context).controller;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      color: Theme.of(context).accentColor.withOpacity(0.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.headset_mic,
            size: 40,
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Awesome",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text("App",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20))
            ],
          ),
          RichText(
            text: TextSpan(style: TextStyle(fontSize: 20), children: <TextSpan>[
              TextSpan(text: "Aewsome"),
              TextSpan(
                  text: "App", style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
          ),
          Container(
            height: 30,
          ),
          CiclerButton(
            backgroundColor: Colors.transparent,
            bordeColor: Colors.white,
            label: "SIGN UP",
            onTap: () {
              ProviderPageController.of(context).toPage(0);
            },
          ),
          Container(
            height: 30,
          ),
          CiclerButton(
            backgroundColor: Colors.white,
            textColor: Theme.of(context).accentColor,
            label: "Login",
            onTap: () {
              ProviderPageController.of(context).toPage(2);
            },
          )
        ],
      ),
    );
  }
}
