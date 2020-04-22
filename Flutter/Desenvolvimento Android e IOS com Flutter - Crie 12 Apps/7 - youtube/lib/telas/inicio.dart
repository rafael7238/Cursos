import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/Videos.dart';

class Inicio extends StatefulWidget {
  String p;
  Inicio(this.p);
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideo(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  void initState() {
    super.initState();
    print("chamado 1 - initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("chamado 2 - didChangeDependencies");
  }

  @override
  void didUpdateWidget(Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("chamado 2 - didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
    print("chamado 4 - dispose");
  }

  @override
  Widget build(BuildContext context) {

   print("chamado 3 - build");

    return FutureBuilder<List<Video>>(
        future: _listarVideo(widget.p),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    List<Video> videos = snapshot.data;
                    Video video = videos[index];
                    return GestureDetector(
                      onTap: (){
                            FlutterYoutube.playYoutubeVideoById(
                            apiKey: CHAVE_YOUTUBE,
                            videoId: video.id,
                          autoPlay: true,
                          fullScreen: true
                        );

                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(video.image))),
                          ),
                          ListTile(
                            title: Text(video.titulo),
                            subtitle: Text(video.descricao),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 50,
                    color: Colors.red,
                  ),
                  itemCount: snapshot.data.length,
                );
              } else {
                return Center(
                  child: Text("Nenhum Dado a ser exibido"),
                );
              }
              break;
          }
        });
  }
}
