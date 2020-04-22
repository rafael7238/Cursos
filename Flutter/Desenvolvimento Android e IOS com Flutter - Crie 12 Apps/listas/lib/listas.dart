import 'package:flutter/material.dart';

class Listas extends StatefulWidget {
  @override
  _ListasState createState() => _ListasState();
}

class _ListasState extends State<Listas> {
  List _itens = [];

  void _carregarItens() {
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} ipsum dolor sit amet.";
      item["descricao"] = "Descricao ${i} ipsum dolor sit amet.";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, indice) {
            // print("item ${_itens[indice].toString()}");
            return ListTile(
              onTap: () {
                //print("Cloque com o ${indice}");
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text(_itens[indice]["titulo"]),
                      titlePadding: EdgeInsets.all(20),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.orange
                      ),
                      content: Text(_itens[indice]["descricao"]),
                      actions: <Widget>[
                        FlatButton(onPressed: (){
                          
                        },child: Text("Sim"),),
                        FlatButton(onPressed: (){
                          Navigator.pop(context);
                        },child: Text("Não"),)
                      ],
                      //contentTextStyle: TextStyle(),
                     // backgroundColor: Colors.red,
                    //  contentPadding: EdgeInsets.all(80),
                    );
                  }
                );
              },
              onLongPress: () {
               // print("Cloque com o onLong");
              },
              title: Text(_itens[indice]["titulo"]),
              subtitle: Text(_itens[indice]["descricao"]),
            );
          },
        ),
      ),
    );
  }
}