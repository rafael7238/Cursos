import 'package:flutter/material.dart';

class Cabecalho extends StatefulWidget {


  @override
  _CabecalhoState createState() => _CabecalhoState();
}

class _CabecalhoState extends State<Cabecalho> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: <Widget>[
          Container(
          height: 26.0,
          decoration: new BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 26.0,
                ),
              ],
            ),
          ),
        ),
          ClipOval(
          child: Image.asset(
            'img/paola.jpg',
            width: 50,
            height: 50,
            //fit: BoxFit.cover,
          ),
        )
        ],
      );
  }
}
