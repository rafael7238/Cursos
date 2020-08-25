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
  TextEditingController toDoControoler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lista de Tarefas",
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
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0),
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                      title: Text(_toDoList[index]["title"]) ?? Text("Nada"),
                      onChanged: (bool value) {
                        setState(() {
                          _toDoList[index]["ok"] = value;
                        });
                      },
                      value: _toDoList[index]["ok"] ?? true,
                      secondary: CircleAvatar(
                          child: Icon(_toDoList[index]["ok"]
                              ? Icons.check
                              : Icons.error)));
                },
                itemCount: _toDoList.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _addToDo() {
    setState(() {
      Map<String, dynamic> newTodo = Map();
      newTodo["title"] = toDoControoler.text;
      toDoControoler.text = "";
      newTodo["ok"] = false;
      _toDoList.add(newTodo);
    });
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
}
