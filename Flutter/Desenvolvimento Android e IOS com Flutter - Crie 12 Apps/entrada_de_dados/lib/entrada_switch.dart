import 'package:flutter/material.dart';

class entrada_switch extends StatefulWidget {
  @override
  _entrada_switchState createState() => _entrada_switchState();
}

class _entrada_switchState extends State<entrada_switch> {
  bool _escolhaUsuario = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Switch(
              value: _escolhaUsuario,
              onChanged: (bool valor) {
                setState(() {
                  _escolhaUsuario = valor;
                });
              },
            ),
            Text("Receber Notificação"),
            RaisedButton(
              child: Text("Salvar"),
              onPressed: () {
                print("O valor é $_escolhaUsuario");
              },
            )
          ],
        ),
      ),
    );
  }
}