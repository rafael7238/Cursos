import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  String info = "Informe Valores";
  double resultado = 0;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void resetValores() {
    setState(() {
      info = "Informe Valores";
    });
    alturaController.text = "";
    _formKey = GlobalKey<FormState>();
    pesoController.text = "";
  }

  void calcularIMC() {
    if (_formKey.currentState.validate()) {
      resultado = (double.parse(pesoController.text) /
          (double.parse(alturaController.text) /
              100 *
              double.parse(alturaController.text) /
              100));
      if (resultado <= 17) {
        setState(() {
          info = "IMC: $resultado. Abaixo do peso";
        });
      } else {
        setState(() {
          info = "IMC: $resultado. Peso Normal";
        });
      }
    }
  }

  Widget textField(String texto, TextEditingController controler) {
    return TextFormField(
      controller: controler,
      style: TextStyle(
        color: Colors.green,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "$texto",
        labelStyle: TextStyle(
          color: Colors.green,
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Insira algum valor do $texto";
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: resetValores,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person_outline,
                color: Colors.green,
                size: 120,
              ),
              textField("Peso(Kg)", pesoController),
              textField("Altura(Cm)", alturaController),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: calcularIMC,
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.green[50], fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              Text(
                "$info",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
