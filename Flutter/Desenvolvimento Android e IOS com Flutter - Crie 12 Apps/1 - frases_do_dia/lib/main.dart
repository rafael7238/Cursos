import 'package:flutter/material.dart';

/*Stateless -> Widgets que não podem ser alterados(Constantes)*/
/*Stateful -> Widgets que podem ser alterados (Variáveis)    */

void main() {
  runApp(MaterialApp(
      //debugShowCheckedModeBanner: false,
      //  title: "Frases do dia",
      //  home: Home()));
      home: HomeStateful()));
}

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  var titulo = "Instagram";
  var variavel = "Menu";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(variavel),
            RaisedButton(
              onPressed: () {
                setState(() {
                  variavel = "Menu 2";
                  variavel = "Menu";
                });
                print("Teste");
              },
              child: Text("Clique aqui"),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[Text("Texto 1"), Text("Texto 2")],
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var titulo = "Instagram";

    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Conteúdo Principal"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[Text("Texto 1"), Text("Texto 2")],
          ),
        ),
      ),
    );
  }
}

/*Container(
        margin: EdgeInsets.all(40), // Espaçamento Geral de todos
        //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        // margin: EdgeInsets.fromLTRB(10,60,30,40), //Espaçamento Externo
        //margin: EdgeInsets.only(top: 50, left: 50),
        //  color: Colors.black,
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.green),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            Text(
              "Usuário sdfsad sdaf asdf dsadsd aa  : ",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text("Nada", textAlign: TextAlign.justify),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text("T2"),
            ),
            Text("Senha", textAlign: TextAlign.justify),
            Row(
              children: <Widget>[
                Text(
                  "51",
                  style: TextStyle(fontSize: 10),
                ),
                FlatButton(
                  onPressed: () {
                    print("Pressionado");
                  },
                  child: Text(
                    "Botão",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[300],
                        decoration: TextDecoration.none),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text("T1"), Text("T2"), Text("T3")],
            ),
            Image.asset(
             
              "img/mesa.jpg",
               fit: BoxFit.scaleDown,
              
            )
          ],
        ),
        //home: Container(color: Colors.blue,      ),
      )*/
