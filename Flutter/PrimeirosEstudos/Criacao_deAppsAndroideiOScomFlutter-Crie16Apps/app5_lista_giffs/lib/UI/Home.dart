import 'dart:convert';

import 'package:app5_lista_giffs/UI/Giff_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _search = "";
  int _offSet = 0;

  Future<Map> _getGiffs() async {
    http.Response response;

    if (_search.isEmpty || _search == null)
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=WbR0aWs8qRNyPfyYkCeGmr3uMlCS7n7s&limit=20&rating=g");
    else
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=WbR0aWs8qRNyPfyYkCeGmr3uMlCS7n7s&q=${_search}&limit=19&offset=${_offSet}&rating=g&lang=en");
    return json.decode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getGiffs().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.network(
              "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Pesquise Aqui",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                textAlign: TextAlign.center,
                onSubmitted: (value) {
                  setState(() {
                    _search = value;
                    _offSet = 0;
                  });
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: _getGiffs(),
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
              ),
            )
          ],
        ));
  }

  int _countGiffs(List data) {
    if (_search == null || _search.isEmpty)
      return data.length;
    else
      return data.length + 1;
  }

  Widget _createGiffTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: _countGiffs(snapshot.data["data"]),
      itemBuilder: (context, index) {
        if (_search == null ||
            _search.isEmpty ||
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
              Share.share(snapshot.data["data"][index]["images"]["fixed_height"]
                  ["url"]);
            },
          );
        } else {
          return GestureDetector(
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
          );
        }
      },
    );
  }
}
