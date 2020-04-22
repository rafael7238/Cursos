import 'package:flutter/material.dart';

class entrada_checkbox extends StatefulWidget {
  @override
  _entrada_checkboxState createState() => _entrada_checkboxState();
}

class _entrada_checkboxState extends State<entrada_checkbox> {
  bool _estaSelecionado = false;
  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              title: Text("Comida Brasileira"),
              subtitle: Text("A melhor comida do mundo"),
              //  activeColor: Colors.red,
              // secondary: Icon(Icons.add_box),
              //selected: true,
              value: _comidaBrasileira,
              onChanged: (bool resuldata) {
                setState(() {
                  _comidaBrasileira = resuldata;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Comida Mexicana"),
              subtitle: Text("A melhor comida do mundo"),
              //  activeColor: Colors.red,
              // secondary: Icon(Icons.add_box),
              //selected: true,
              value: _comidaMexicana,
              onChanged: (bool resuldata) {
                setState(() {
                  _comidaMexicana = resuldata;
                });
              },
            ),
            RaisedButton(
              child: Text(
                "Salvar",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                var comidaBrasil = _comidaBrasileira.toString();
                var comidaMexicana = _comidaMexicana.toString();
                print(
                    "Comida Brasileira $comidaBrasil e Comida Mexicana $comidaMexicana");
              },
            ),
            Text("Comida Brasileira"),
            Checkbox(
              value: _estaSelecionado,
              onChanged: (bool valor) {
                setState(() {
                  _estaSelecionado = valor;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
