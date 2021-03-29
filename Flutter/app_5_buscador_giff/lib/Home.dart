import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:app_5_buscador_giff/Giff_page';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String search = "";
  int _offSet = 0;

  Future<Map> _getSearch() async {
    http.Response resposta;
    Uri uri;
    String url;

    if (search.isEmpty)
      url =
          "https://api.giphy.com/v1/gifs/trending?api_key=WbR0aWs8qRNyPfyYkCeGmr3uMlCS7n7s&limit=20&rating=g";
    else
      url =
          "https://api.giphy.com/v1/gifs/search?api_key=WbR0aWs8qRNyPfyYkCeGmr3uMlCS7n7s&q=$search&limit=19&offset=$_offSet&rating=g&lang=pt";
    uri = Uri.parse(url);
    resposta = await http.get(uri);
    return json.decode(resposta.body);
  }

  int _countGiffs(List data) {
    if (search == null || search.isEmpty)
      return data.length;
    else
      return data.length + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.network(
              "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Pesquise Aqui",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
                onSubmitted: (value) {
                  setState(() {
                    search = value;
                    _offSet = 0;
                  });
                },
              ),
              Expanded(
                  child: FutureBuilder(
                future: _getSearch(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        height: 200,
                        width: 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 8.0,
                        ),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Container();
                      } else
                        return _createGiffTable(context, snapshot);
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createGiffTable(BuildContext context, AsyncSnapshot snapshot) {
    {
      return GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: _countGiffs(snapshot.data["data"]),
        itemBuilder: (context, index) {
          if (search == null ||
              search.isEmpty ||
              index < snapshot.data["data"].length) {
            return GestureDetector(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: snapshot.data["data"][index]["images"]["fixed_height"]
                    ["url"],
                height: 300.0,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GiffPage(snapshot.data["data"][index])));
              },
              onLongPress: () {
                Share.share(snapshot.data["data"][index]["images"]
                    ["fixed_height"]["url"]);
              },
            );
          } else {
            return Container(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 70.0,
                    ),
                    Text(
                      "Carregar mais...",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                onTap: () {
                  setState(() {
                    _offSet += 19;
                  });
                },
              ),
            );
          }
        },
      );
    }
  }
}
