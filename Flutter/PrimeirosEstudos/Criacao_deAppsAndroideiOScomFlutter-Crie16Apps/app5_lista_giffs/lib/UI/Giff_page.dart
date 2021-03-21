import 'package:flutter/material.dart';
import 'package:share/share.dart';

class GiffPage extends StatelessWidget {
  final Map _gifData;

  GiffPage(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(_gifData["images"]["fixed_height"]["url"]);
            },
          )
        ],
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          _gifData["title"],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Image.network(
          _gifData["images"]["fixed_height"]["url"],
        ),
      ),
    );
  }
}
