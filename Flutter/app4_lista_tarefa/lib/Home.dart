import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _readdata().then((value) {
      setState(() {
        _toDoList = json.decode(value);
      });
    });
  }

  List _toDoList = [];
  final _newTask = TextEditingController();
  Map<String, dynamic> _lastremoved;
  int _lastRemovedint;

  void _addToDo() {
    if (_newTask.text.isNotEmpty) {
      Map<String, dynamic> newTodo = Map();
      newTodo["title"] = _newTask.text;
      newTodo["ok"] = false;
      _newTask.text = "";
      setState(() {
        _toDoList.add(newTodo);
        _saveData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _newTask,
                    decoration: InputDecoration(
                      labelText: "Nova Tarefa",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text("ADD"),
                  onPressed: _addToDo,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent)),
                )
              ],
            ),
          ),
          Expanded(
              child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0),
                itemCount: _toDoList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (value) {
                      setState(() {
                        _lastremoved = Map.from(_toDoList[index]);
                        _lastRemovedint = index;
                        _toDoList.removeAt(index);
                        _saveData();
                        final snack = SnackBar(
                          content: Text(
                              "Tarefa \"${_lastremoved["title"]}\" removida!"),
                          action: SnackBarAction(
                            label: "Desfazer",
                            onPressed: () {
                              setState(() {
                                _toDoList.insert(_lastRemovedint, _lastremoved);
                              });
                            },
                          ),
                          duration: Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snack);
                      });
                    },
                    key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment(-0.9, 0.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: CheckboxListTile(
                      title: Text(_toDoList[index]["title"]),
                      value: _toDoList[index]["ok"],
                      secondary: CircleAvatar(
                        child: Icon(
                          _toDoList[index]["ok"] ? Icons.check : Icons.error,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _toDoList[index]["ok"] = value;
                          _saveData();
                        });
                      },
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readdata() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

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
}
