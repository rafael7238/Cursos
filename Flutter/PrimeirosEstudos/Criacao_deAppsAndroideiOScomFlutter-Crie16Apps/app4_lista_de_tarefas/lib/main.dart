import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      primaryColor: Colors.blueAccent,
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _toDoList = [];
  Map<String, dynamic> valorExcluido;
  int posicaoValorExcluido;
  TextEditingController toDoControoler = TextEditingController();

  @override
  void initState() {
    super.initState();
    _readData().then((value) {
      setState(() {
        _toDoList = json.decode(value);
      });
    });
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    setState(() {
      _toDoList.sort((a, b) {
        if (a["ok"] && !b["ok"])
          return 1;
        else if (!a["ok"] && b["ok"])
          return -1;
        else
          return 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lista de Tarefas 2",
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
              //   color: Colors.yellow,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: toDoControoler,
                      decoration: InputDecoration(
                        labelText: "Nova Tarefa",
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    onPressed: _addToDo,
                    child: Text("Add"),
                  )
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemBuilder: buildItem,
                  itemCount: _toDoList.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _addToDo() {
    if (toDoControoler.text.isNotEmpty) {
      setState(() {
        Map<String, dynamic> newTodo = Map();
        newTodo["title"] = toDoControoler.text;
        toDoControoler.text = "";
        newTodo["ok"] = false;
        _toDoList.add(newTodo);
        _saveData();
      });
    }
  }

  Future<File> _getFile() async {
    var diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/data.json");
  }

  Future<File> _saveData() async {
    String dado = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(dado);
  }

  Future<String> _readData() async {
    try {
      final diretorio = await _getFile();
      return diretorio.readAsString();
    } catch (e) {
      print("Erro: ${e.toString()}");
      return null;
    }
  }

  Widget buildItem(BuildContext context, int index) {
    return Dismissible(
      onDismissed: (direcao) {
        valorExcluido = Map.from(_toDoList[index]);
        posicaoValorExcluido = index;
        setState(() {
          _toDoList.removeAt(index);
        });
        _saveData();

        final snack = SnackBar(
          content: Text("Tarefa ${valorExcluido["title"]} removido"),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              setState(() {
                _toDoList.insert(posicaoValorExcluido, valorExcluido);
                _saveData();
              });
            },
          ),
          duration: Duration(seconds: 2),
        );

        Scaffold.of(context).showSnackBar(snack);
      },
      direction: DismissDirection.startToEnd,
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: CheckboxListTile(
          title: Text(_toDoList[index]["title"]) ?? Text("Nada"),
          onChanged: (bool value) {
            setState(() {
              _toDoList[index]["ok"] = value;
              _saveData();
            });
          },
          value: _toDoList[index]["ok"] ?? true,
          secondary: CircleAvatar(
              child: Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error))),
    );
  }
}
