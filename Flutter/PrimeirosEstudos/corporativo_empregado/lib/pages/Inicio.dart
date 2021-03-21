import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "Olá, Paolla",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Eventos",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    "images/aniversariantes.jpg",
                    height: 100,
                  )
                ],
              ),
              Divider(
                color: Colors.blue,
                indent: 1,
              ),
              Container(
                child: SizedBox(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Férias da Equipe",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text("Maria"),
                          trailing: Text("13/08 - 10/09"),
                        ),
                        ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text("José"),
                          trailing: Text("13/08 - 10/09"),
                        ),
                        ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text("Tais"),
                          trailing: Text("13/08 - 10/09"),
                        ),
                        ListTile(
                          trailing: Text("Ver todos",
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.blue,
                indent: 1,
              ),
              Container(
                  child: SizedBox(
                      child: Card(
                          child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Ponto do Dia"),
                    subtitle: Text("9:03 - 12:03 - 13:04 - 19:00"),
                  ),
                  ListTile(
                    title: Text("Banco de Horas"),
                    subtitle: Text("+5 horas"),
                  )
                ],
              )))),
              Divider(
                color: Colors.blue,
                indent: 1,
              ),
              Container(
                child: SizedBox(
                  child: Card(),
                ),
              )
            ]),
      ),
    );
  }
}
