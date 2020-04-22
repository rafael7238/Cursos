import 'package:consumo_servico_avancado/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(url + "/posts");
    var dadosJson = json.decode(response.body);
    //  print(dadosJson);
    List<Post> postagens = List();
    for (var post in dadosJson) {
      //print(post["title"]);
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
    // print(postagens.toString());
  }

  _post() async {
    http.Response response = await http.post(url + "/posts",
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: json.encode(
            {"id": null, "title": 'foo', "body": 'bar', "userId": 120}));

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  _put() async {
    http.Response response = await http.put(url + "/posts/2",
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: json.encode(
            {"id": null, "title": 'foo', "body": 'bar', "userId": 120}));

    print("Atualização: ${response.statusCode}");
    print("Atualização: ${response.body}");
  }

  _patch() async {
    http.Response response = await http.patch(url + "/posts/2",
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: json.encode({"id": null, "title": 'foo'}));

    print("Atualização Patch: ${response.statusCode}");
    print("Atualização Patch: ${response.body}");
  }

  _delete() async {
    http.Response response = await http.delete(url + "/posts/2");
    print("Atualização Patch: ${response.statusCode}");
    print("Atualização Patch: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de Serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Salvar"),
                  onPressed: _post,
                ),
                RaisedButton(
                  child: Text("Atualizar"),
                  onPressed: _put,
                ),
                RaisedButton(
                  child: Text("Remover"),
                  onPressed: _delete,
                )
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
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
                            List<Post> lista = snapshot.data;
                            Post post = snapshot.data[index];

                            return ListTile(
                              title: Text(post.title),
                              subtitle: Text(post.id.toString()),
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
        ),
      ),
    );
  }
}
