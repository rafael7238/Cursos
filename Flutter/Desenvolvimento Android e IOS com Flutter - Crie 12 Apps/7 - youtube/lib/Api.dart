import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/Videos.dart';

const CHAVE_YOUTUBE = "AIzaSyCUbD2oMQXZQlEwelniBxhW2HWWprKUreg";
const ID_CANAL = "UCWDeEIDAIi_oYKDiqwfGyRg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE"
            // "&channelId=$ID_CANAL"
            "&q=$pesquisa");

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJaons = json.decode(response.body);
      List<Video> videos = dadosJaons["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
/*
      for (var video in videos) {
        print("Resultado=" + dadosJaons["items"]);
      }*/

    } else {
      print(response.body);
    }
  }
}
