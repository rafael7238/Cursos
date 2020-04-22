import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController _playerController;

  @override
  void initState() {
    super.initState();
    _playerController = VideoPlayerController.network(
        "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4")
      ..initialize().then((_) {
        setState(() {
          _playerController.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: _playerController.value.aspectRatio,
          child: VideoPlayer(_playerController),
        ),
      ),
    );
  }
}
