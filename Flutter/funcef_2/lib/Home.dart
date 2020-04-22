import 'dart:io';

import 'package:flutter/material.dart';
import 'package:funcef_2/Eventos.dart';
import 'package:funcef_2/Inicial_eventos.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Inicial_eventos> buscaEvento() {
    List<Inicial_eventos> jobs = [];
    for (int i = 0; i < 10; i++) {
      jobs.add(new Inicial_eventos(nomeEvento: "Reunião DIPAR"));
    }
    return jobs;
  }

  Widget eventos() {
    return Container(
      width: double.infinity,
      height: 10,
      constraints: BoxConstraints.expand(height: 150),
      child: ListView(
          padding: EdgeInsets.only(left: 10),
          scrollDirection: Axis.horizontal,
          children: buscarEventos()),
    );
  }

  List<Widget> buscarEventos() {
    List<Widget> listaEventos = [];
    List<Inicial_eventos> jobs = buscaEvento();
    for (Inicial_eventos job in jobs) {
      listaEventos.add(getJobCard(job));
    }
    return listaEventos;
  }

  Widget getJobCard(Inicial_eventos job) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 20, bottom: 30, top: 30),
      height: 150,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              //offset: Offset.fromDirection(),
              blurRadius: 2.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Título", //job.companyName,
                style: jobCardTitileStyleBlue,
              )
            ],
          ),
          Text("Horário de Inicio" + " - " + "Horário Fim: ",
              style: jobCardTitileStyleBlack),
          Text(("Local:"), style: salaryStyle)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //  List<Widget> telas = [Inicial(), Pagamento(), Ponto(), Ferias()];
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            children: <Widget>[
              Container(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                      size: 26.0,
                    ),
                    Container(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          "images/paola.jpg",
                          //fit: BoxFit.cover,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Bem Vindo(a), Rafael",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Eventos",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              eventos(),
              Container(
                height: 2,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                // margin: EdgeInsets.only(right: 20, bottom: 30, top: 30),
                height: 65,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        //offset: Offset.fromDirection(),
                        blurRadius: 2.0,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Marcações realizadas do dia", //job.companyName,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Text("08:00 - 12:00 - 13:00 - 17:00",
                        style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Container(
                height: 30,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(10),
                // margin: EdgeInsets.only(right: 20, bottom: 30, top: 30),
                height: 90,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        //offset: Offset.fromDirection(),
                        blurRadius: 2.0,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Saldo Mês", //job.companyName,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Text("+ 03:00", style: TextStyle(fontSize: 22)),
                    Text(("Banco de Horas"), style: TextStyle(fontSize: 12))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        ],
      ),
    );
  }
}
