import 'package:flutter/material.dart';

class campo_texto extends StatefulWidget {
  @override
  _campo_textoState createState() => _campo_textoState();
}

class _campo_textoState extends State<campo_texto> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Entrada de Dados",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(32),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Digite um Valor"),
                //enabled: false,
                maxLength: 2,
                maxLengthEnforced: false,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                ),
                obscureText: true,
                /*onChanged: (String e){
                  print(e);
                },*/
                onSubmitted: (String texto) {
                  print(texto);
                },
                controller: _textEditingController,
              ),
            ),
            RaisedButton(
              child: Text("Salvar"),
              color: Colors.lightGreen,
              onPressed: () {
                print(_textEditingController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
