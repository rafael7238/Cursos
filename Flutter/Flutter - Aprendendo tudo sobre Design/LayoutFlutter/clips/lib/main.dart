import 'package:clips/clipperPath.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      // appBar: AppBar(),
      body: ClipPath2(),
    ),
  ));
}

class Fotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            child: /*ClipOval*/ ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSw4ZAv_UbV9T9laG7dgPIks4jRGtosXD_q7w6X0j4b1ir9PMW0",
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Rafael L. de Vasconcelos",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "rafael7238@funcef.com",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          SizedBox(
            height: 30,
          ),
          ButtonTheme(
            minWidth: 150,
            child: RaisedButton.icon(
              textColor: Colors.white,
              color: Colors.blue,
              icon: Icon(Icons.arrow_back),
              label: Text("Sair"),
              onPressed: () {},
            ),
          ),
          Material(
            elevation: 7,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(40),
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () {
                print("Clicou Aqui");
              },
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                  child: Text(
                    "Sair",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
