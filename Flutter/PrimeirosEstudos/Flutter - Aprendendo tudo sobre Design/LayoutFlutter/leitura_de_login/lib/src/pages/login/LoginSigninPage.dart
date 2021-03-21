import 'package:flutter/material.dart';
import 'package:leitura_de_login/src/pages/login/widgets/CircleButton.dart';
import 'package:leitura_de_login/src/pages/login/widgets/CustomTextField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginSigninPage extends StatefulWidget {
  @override
  _LoginSigninPageState createState() => _LoginSigninPageState();
}

class _LoginSigninPageState extends State<LoginSigninPage> {
 
  Widget _textForgot() {
    return Container(
      width: double.infinity,
      child: Text(
        "Forgot PassWord",
        textAlign: TextAlign.right,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
      ),
    );
  }

  Widget _lineTextLine() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Divider(
          color: Colors.black,
          height: 15,
        )),
        Text(
          "OR CONNECT WITH",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        Expanded(
            child: Divider(
          color: Colors.black,
          height: 15,
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.9),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.headset_mic,
            size: 40,
            color: Theme.of(context).accentColor,
          ),
          CustomTextField(
            label: "Email",
            hint: "rafael@funcef.com.br",
          ),
          Container(
            height: 20,
          ),
          CustomTextField(
            label: "PASSWORD",
            hint: "*********",
          ),
          Container(
            height: 50,
          ),
          _textForgot(),
          Container(
            height: 40,
          ),
          CiclerButton(
            label: "SIGN UP",
          ),
          Container(
            height: 40,
          ),
          _lineTextLine(),
          Container(
            height: 40,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CiclerButton(
                    backgroundColor: Colors.blue[800],
                    label: "Facebook",
                    icon: Icon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.white,
                    )),
              ),
              Container(
                width: 20,
              ),
              Expanded(
                child: CiclerButton(
                    backgroundColor: Colors.red[700],
                    label: "Google",
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
