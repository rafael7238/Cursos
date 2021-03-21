import 'package:flutter/material.dart';
import 'package:funcef/Global/Eventos.dart';
import 'package:funcef/model/Inicial_eventos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Inicial extends StatefulWidget {
  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  void _recuperarPrecoBitcoin() async {
    String _resultado = "0";
    String queryParameters =
        '{"usuario": "rafaelvasconcelos", "senha": "Func@f201911"}';
    String url = "C:\flutter\Flutter\funcef\lib\Inicial\teste.json";
    http.Response response;
    response = await http.post(
      url,
      headers: {"Content-type": "application/json; charset=UTF-8"},
    );
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["Menssagem"].toString();
    setState(() {
      _resultado = logradouro;
    });
  }

  Widget saldoDeHoras() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            //offset: Offset.fromDirection(),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Meu Saldo de Horas",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text("+27:00",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 12,
          ),
          Text(
            "Horas Extras",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  List<Inicial_eventos> buscaEvento() {
    List<Inicial_eventos> jobs = [];
    for (int i = 0; i < 10; i++) {
      jobs.add(new Inicial_eventos(nomeEvento: "Reunião DIPAR"));
    }
    return jobs;
  }

  Widget eventos() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 80,
      constraints: BoxConstraints.expand(height: 200),
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
              blurRadius: 10.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                  //backgroundImage: job.companyLogo,

                  ),
              Text(
                "Teste", //job.companyName,
                style: jobCardTitileStyleBlue,
              )
            ],
          ),
          Text("Teste" + " - " + "Teste", style: jobCardTitileStyleBlack),
          Text("Teste"),
          Text(("TEste"), style: salaryStyle)
        ],
      ),
    );
  }

  Widget pontoDoDia() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            //offset: Offset.fromDirection(),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Ponto do Dia",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("9:00"),
              Text("12:00"),
              Text("13:00"),
              Text("19:00"),
              Text("20:00"),
              Text("22:00")
            ],
          ),
        ],
      ),
    );
  }

  Widget ferias() {
    return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 245,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              //offset: Offset.fromDirection(),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Férias do Time",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: ClipOval(
                child: Image.asset(
                  'img/paola.jpg',
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text("Maria"),
              trailing: Text("12/10/2019 - 12/11/2019"),
            ),
            ListTile(
              leading: ClipOval(
                child: Image.asset(
                  'img/paola.jpg',
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text("Maria"),
              trailing: Text("12/10/2019 - 12/11/2019"),
            ),
            ListTile(
              leading: ClipOval(
                child: Image.asset(
                  'img/paola.jpg',
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text("Maria"),
              trailing: Text("12/10/2019 - 12/11/2019"),
            ),
          ],
        ));
  }

  Widget pendenciaAprovacao() {
    return Container(
      constraints: BoxConstraints.expand(height: 120),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            //offset: Offset.fromDirection(),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Pendências de Aprovação",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.red),
                child: Text(
                  "2",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.red),
                child: Text(
                  "0",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.red),
                child: Text(
                  "0",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Text("Férias"),
              ),
              Container(
                child: Text("Ponto"),
              ),
              Container(
                child: Text("Abono"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.blueGrey[50],
        //  padding: EdgeInsets.only(top: 9),
        //alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //   Cabecalho(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Bem Vinda, Maria",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Eventos",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(),
              eventos(),
              SizedBox(
                height: 12,
              ),
              pendenciaAprovacao(),
              SizedBox(
                height: 12,
              ),
              saldoDeHoras(),
              SizedBox(
                height: 20,
              ),
              pontoDoDia(),
              SizedBox(
                height: 20,
              ),
              ferias(),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                onPressed: _recuperarPrecoBitcoin,
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.orange,
              )
            ],
          ),
        ),
      ),
    );
  }
}