import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audio = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");
  bool primeiraExecucao = true;
  double volume = 0.5;

  _executar() async {
    audio.setVolume(volume);
    if (primeiraExecucao) {
      audio = await audioCache.play("audio.mp3");
      primeiraExecucao = false;
    } else {
      audio.resume();
    }

    // String url ="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3" ;
    // int resultado = await audio.play(url);

    //if (resultado==1){

    //}
  }

  _pausar() async {
    int resultado = await audio.pause();
    if (resultado == 1) {}
  }

  _parar() async {
    int resultado = await audio.stop();
    if (resultado == 1) {}
  }

  @override
  Widget build(BuildContext context) {
    // _executar();
    return Scaffold(
      appBar: AppBar(
        title: Text("Xixi na privada"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:8.0 ),
                child: Text("Volume: "),
              ),
              Slider(
                value: volume,
                min: 0,
                max: 1,
                divisions: 10,
                onChanged: (novoVolume) {
                  setState(() {
                    volume = novoVolume;
                  });
                  audio.setVolume(novoVolume);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/executar.png"),
                  onTap: () {
                    _executar();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/pausar.png"),
                  onTap: () {
                    _pausar();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/parar.png"),
                  onTap: () {
                    _parar();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
