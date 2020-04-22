import 'package:corporativo_empregado/pages/Inicio.dart';
import 'package:corporativo_empregado/pages/Pagamentos/Pagamento.dart';
import 'package:corporativo_empregado/pages/Atestado.dart';
import 'package:corporativo_empregado/pages/Ponto.dart';
import 'package:corporativo_empregado/pages/Ferias.dart';
import 'package:corporativo_empregado/pages/Gestao.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(),
      Pagamento(),
      Ponto(),
      Ferias(),
      Atestado(),
      Gestao()
    ];

    return Scaffold(
        appBar: AppBar(
          /*title: Image.asset(
            "images/funcef_logo.jpg",
            height: 98,
          ),*/
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              //icon: Icon(Icons.account_circle),
              icon:IconButton(
                icon: Icon(Icons.account_circle) ,
                //Image.asset("images/foto_perfil.png"),
                onPressed: (){
                },
              ),

           //   Image.asset("images/foto_perfil.png"),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 20),
          child: telas[_indiceAtual],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
                title: Text("Inicio"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text("Pagamento"), icon: Icon(Icons.payment)),
            BottomNavigationBarItem(
                title: Text("Ponto"), icon: Icon(Icons.access_time)),
            BottomNavigationBarItem(
                title: Text("Férias"), icon: Icon(Icons.insert_emoticon)),
            BottomNavigationBarItem(
                title: Text("Atestado"), icon: Icon(Icons.local_hospital)),
          ],
          /*  items: [
          BottomNavigationBarItem(title:Text("Inicio"),icon: Icon(Icons.home))
        ],
      ),*/
        ));
  }
}
