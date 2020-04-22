import 'package:flutter/material.dart';
import 'package:funcef/Global/Cabecalho.dart';
import 'package:funcef/Global/SubMenus.dart';

class Ponto extends StatefulWidget {
  @override
  _PontoState createState() => _PontoState();
}

class _PontoState extends State<Ponto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         padding: EdgeInsets.only(left: 15,right: 15),
          child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            //  Cabecalho(cab: "Ponto",),
           //   SizedBox(height: 20),
              subMenus(Icon(Icons.drafts), "Espelho de Ponto"),
              SizedBox(height: 20),
              subMenus(Icon(Icons.input), "Solicitar Abono"),
              SizedBox(height: 20),
              subMenus(Icon(Icons.input), "Relógio")
            ]),
      )),
    );
  }
}