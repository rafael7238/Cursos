import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: HomeWidget(),
    ),
  ));
}

class HomeWidget extends StatelessWidget {
  _onPress() {
    print("CLicado no Item");
  }

  Widget listTitle() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text("Item 1"),
      subtitle: Text("Subtitulo 1"),
      onTap: _onPress,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Icon(Icons.android),
          Icon(Icons.android),
          Icon(Icons.android),
          Icon(Icons.android),
          IconButton(
            icon: Icon(Icons.android),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.android),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.android),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.android),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.android),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.android),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.android),
            onPressed: () {},
          ),

          /*
          listTitle(),
          listTitle(),
          listTitle(),
          listTitle(),
          listTitle(),
          listTitle(),
          listTitle(),
          SizedBox(
            height: 30,
          ),
          ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Icon(Icons.android),
              Icon(Icons.android),
              Icon(Icons.android),
            ],
          ),*/
        ],
      ),
    );
  }
}
