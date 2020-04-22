import 'package:flutter/material.dart';
import 'package:funcef/Ferias/Ferias.dart';
import 'package:funcef/Inicial/Inicial.dart';
import 'package:funcef/Pagamento/Pagamento.dart';
import 'package:funcef/Ponto/Ponto.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [Inicial(), Pagamento(), Ponto(), Ferias()];

    return Scaffold(
   //   backgroundColor: Colors.blueGrey[50],
     // drawer: menuLateral(),
      appBar: AppBar(
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
      ),
      body: Scrollbar(
        child: 
          Container(
             alignment: Alignment.center,
            //color: Colors.blueGrey[50],
            //padding: EdgeInsets.only(top: 40, left: 11),
            child: telas[_indiceAtual],
          ),
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
      ),
      /*  items: [
          BottomNavigationBarItem(title:Text("Inicio"),icon: Icon(Icons.home))
        ],
      ),*/
    );
  }
}
