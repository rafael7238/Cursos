import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _textoSalvo = "Nada Salvo";
  TextEditingController _controllerCampo = TextEditingController();

  _salvar() async {
    String valorDigitado = _controllerCampo.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("Nome", valorDigitado);
  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      var teste = prefs.getString("Nome");
      _textoSalvo = prefs.getString("Nome") ?? "Sem Valor";
    });
  }

  _remover() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("Nome");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de Dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(_textoSalvo),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Digite Algo"),
              controller: _controllerCampo,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Salvar",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: _salvar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Recuperar",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: _recuperar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Remover",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: _remover,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
