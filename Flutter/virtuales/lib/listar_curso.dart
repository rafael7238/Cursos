import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtuales/funcoes/func.dart';
import 'package:virtuales/variaveis/var.dart';

import 'cursos.dart';

class Listar extends StatefulWidget {
  String text;
 Future<List<Map>> listaCurso;

  Listar(this.text,this.listaCurso);

  @override
  _ListarState createState() => _ListarState();
}

class _ListarState extends State<Listar> {
  var prog = "N";
  var curso = new Curso("", "", "", "");

  _launchURL(String urlR) async {
    var url = urlR;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //var _listaCurso = recuperarDocumento();

  @override
  Widget build(BuildContext context) {
    //recuperarDocumento(widget.text);
var a = widget.listaCurso;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.text),
        ),
        body: Container()
        /* ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: _listaCurso.length,
        itemBuilder: (context, indice) {
          print(_listaCurso[indice]["imagem"]);
          // print("item ${_itens[indice].toString()}");
          return ListTile(
            onTap: () {
              //print("Cloque com o ${indice}");
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(_listaDefinitiva[indice]["Nome"]),
                      titlePadding: EdgeInsets.all(20),
                      titleTextStyle:
                          TextStyle(fontSize: 20, color: Colors.orange),
                      content: Text(
                        "Você será redirecionado ao site do produto, deseja prosseguir?",
                        textAlign: TextAlign.justify,
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            _launchURL(_listaDefinitiva[indice]["Link"]);
                          },
                          child: Text("Sim"),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Não"),
                        )
                      ],
                      //contentTextStyle: TextStyle(),
                      // backgroundColor: Colors.red,
                      //  contentPadding: EdgeInsets.all(80),
                    );
                  });
            },
            onLongPress: () {
              // print("Cloque com o onLong");
            },
            title: Text(_listaDefinitiva[indice]["Nome"]),
            subtitle: Text(_listaDefinitiva[indice]["Descricao"]),
            leading: Image.network(
              _listaDefinitiva[indice]["Imagem"],
              width: 150,
              height: 200,
            ),
          );
        },
      ),
    );

    /*
*/
*/
        );
  }
}
