import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _lista = [];
  Map<String, dynamic> _ultimoTarefaRemovido = Map();

  TextEditingController _controllerTarefa = TextEditingController();

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    //print(diretorio.path);
    var arquivo = File("${diretorio.path}/dados.json");
    return arquivo;
  }

  _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;

    setState(() {
      _lista.add(tarefa);
    });

    _salvarArquivo();
    _controllerTarefa.text = "";
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();

    String dados = json.encode(_lista);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _lerArquivo().then((dados) {
      setState(() {
        _lista = json.decode(dados);
      });
    });
  }

  Widget criarItemLista(context, index) {
    final item = _lista[index]["titulo"];
    return Dismissible(
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          _ultimoTarefaRemovido = _lista[index];

          _lista.removeAt(index);
          //      _salvarArquivo();

          final snackbar = SnackBar(
            duration: Duration(seconds: 1),
            backgroundColor: Colors.green,
            content: Text("Tarefa Removida"),
            action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                setState(() {
                  _lista.insert(index, _ultimoTarefaRemovido);
                });
                _salvarArquivo();
              },
            ),
          );
          Scaffold.of(context).showSnackBar(snackbar);
        },
        background: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],
          ),
        ),
        key: Key(item + DateTime.now().millisecondsSinceEpoch.toString()),
        child: CheckboxListTile(
          title: Text(_lista[index]['titulo']),
          value: _lista[index]["realizada"],
          onChanged: (valorAlterado) {
            setState(() {
              _lista[index]["realizada"] = valorAlterado;
            });
            _salvarArquivo();
            //print(valorAlterado);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    //_salvarArquivo();
    print(_lista.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de Tarefas",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: _lista.length, itemBuilder: criarItemLista),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: _controllerTarefa,
                    decoration: InputDecoration(labelText: "Digite sua Tarefa"),
                    onChanged: (text) {},
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Cancelar"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton(
                      child: Text("Salvar"),
                      onPressed: () {
                        _salvarTarefa();
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              });
        },
      ),
    );
  }
}
