import 'dart:typed_data';

import 'package:corporativo_empregado/models/Banner.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Atestado extends StatefulWidget {
  @override
  _AtestadoState createState() => _AtestadoState();
}

class _AtestadoState extends State<Atestado> {
  List<BannerFuncef> listBanner = List();
  String url =
      "https://autoatendimentoweb.funcef.com.br/apl/autoatendimento_web/api/ObterBanner";

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }

  Future<List<BannerFuncef>> _recuperarPostagens() async {
    http.Response response = await http.get(url);
    var dadosJson = json.decode(response.body);
    //print(dadosJson.toString());
    // print(dadosJson["Objeto"]);

    for (var item in dadosJson["Objeto"]) {
      BannerFuncef banner = new BannerFuncef();
      banner.id = item["Id"];
      print(item["Nome"]);
      banner.nome = item["Nome"];
      banner.url = item["UrlLink"];
      banner.imagem = item["Imagem"];
      
     

      listBanner.add(banner);
    }
    return listBanner;

    //  print(dadosJson);
    // Banner postagens = Banner(dadosJson["Id"], dadosJson["Nome"], dadosJson["UrlLink"], dadosJson["Imagem"]);

    //return postagens;
    // print(postagens.toString());
  }

  @override
  Widget build(BuildContext context) {
    // _recuperarPostagens();
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: FutureBuilder<List<BannerFuncef>>(
                    future: _recuperarPostagens(),
                    builder: (context, snapshot) {
                      String resultado;
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                          break;
                        case ConnectionState.done:
                        case ConnectionState.active:
                          //    print("Conexão done");
                          if (snapshot.hasError) {
                            //     print("Erro ao Carregar os dados");
                          } else {
                            //     print("Lista Carregou");
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                BannerFuncef post = snapshot.data[index];
                              
                                return Column(
                                  
                                  children: <Widget>[
                                    Text(post.nome),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: 60,
                                        ),
                                        child: Text(post.imagem), 
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          break;
                      }
                    },
                  ),
                )
              ],
            )));
  }
}
