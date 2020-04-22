import 'package:flutter/material.dart';

class entrada_radioBotton extends StatefulWidget {
  @override
  _entrada_radioBottonState createState() => _entrada_radioBottonState();
}

class _entrada_radioBottonState extends State<entrada_radioBotton> {
  String _escolhaUsuario = "F";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Text("Masculino"),
            Radio(
                value: "M",
                groupValue: _escolhaUsuario,
                onChanged: (String valor) {
                  setState(() {
                    _escolhaUsuario = valor;
                  });
                  print("Resultado $valor");
                }),
            Text("Feminino"),
            Radio(
              value: "F",
              groupValue: _escolhaUsuario,
              onChanged: (String valor) {
                setState(() {
                  _escolhaUsuario = valor;
                });
                print("Resultado $valor");
              },
            ),
            RaisedButton(
              child: Text("Salvar",
              style: TextStyle(
                fontSize: 20
              ),),
              onPressed: (){
                print("Resultado $_escolhaUsuario");
              },
            )
          ],
        ),
      ),
    );
  }
}
