import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool password;
  final TextEditingController controller;

  const CustomTextField({Key key, this.label = "", this.hint = "", this.password=false,this.controller=null })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              //  color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          Container(
            height: 10,
          ),
          TextField(

            obscureText: password,
            autofocus: false,
            decoration: InputDecoration(
              hintText: hint,

              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor)),
              disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor)),
            ),
          ),
        ],
      ),
    );
  }
}
