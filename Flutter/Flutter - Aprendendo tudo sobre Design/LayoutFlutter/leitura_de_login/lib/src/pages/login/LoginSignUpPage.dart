import 'package:flutter/material.dart';
import 'package:leitura_de_login/src/pages/login/provider/providerPageController.dart';
import 'package:leitura_de_login/src/pages/login/widgets/CircleButton.dart';
import 'package:leitura_de_login/src/pages/login/widgets/CustomTextField.dart';

class LoginSignUpPage extends StatefulWidget {
  @override
  _LoginSignUpPageState createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
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
            size: 50,
            color: Theme.of(context).accentColor,
          ),
          Container(
            height: 25,
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
            height: 20,
          ),
          CustomTextField(
            label: "CPNFIRM PASSWORD",
            hint: "**********",
          ),
          Container(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              ProviderPageController.of(context).toPage(2);
            },
            child: Container(
              width: double.infinity,
              child: Text(
                "Already have an account?",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor),
              ),
            ),
          ),
          Container(
            height: 40,
          ),
          CiclerButton(
            label: "SIGN UP",
          )
        ],
      ),
    );
  }
}
