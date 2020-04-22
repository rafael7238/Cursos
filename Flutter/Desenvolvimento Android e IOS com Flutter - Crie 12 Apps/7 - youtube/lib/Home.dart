import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/emAlta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "";
  int _indiceAtual = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Bibliotecas(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
            },
          ),
/*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print("VideoCam");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("VideoCam");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("VideoCam");
            },
          ),*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
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
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              title: Text("Inicio"), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text("Em Alta"), icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              title: Text("Em Inscrições"), icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              title: Text("Bibliotecas"), icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
