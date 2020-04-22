import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  @override
  _TelaServicoState createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Servicos"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("images/detalhe_servico.png"),
                  Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Sobre Serviço",
                          style: TextStyle(
                              fontSize: 20, color: Colors.deepOrange)))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text("Consultoria")),
              Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text("Cálculos de Preços")),
              Padding(
                  padding: EdgeInsets.only(top: 16), child: Text("Acompanhar projetos"))
            ],
          ),
        ),
      ),
    );
  }
}
