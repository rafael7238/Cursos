import 'package:container/buttonTextIcon.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: Columnss(),
  )));
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 50,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
        /*Text(
          "Meu primeiro texto",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),*/
      ),
    );
  }
}

class Columnss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/back.jpg"), fit: BoxFit.cover)),
      // color: Colors.yellow,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //  Image.asset("images/logo.png", fit:BoxFit.contain),
          Container(width: 50, height: 50, color: Colors.black),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.red,
          ),
          ButtonICon(),
          ButtonText(),
          ButtonTextIConLocal(),
          ButtonTextICon(
            color: Colors.red,
            text: "Clique aqui",
            icon: Icons.add_a_photo,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                color: Colors.cyan,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.indigo,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.pink,
              )
            ],
          )
        ],
      ),
    );
  }
}

class ButtonICon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(3.0, 5.0),
                  blurRadius: 7)
            ]),
        width: double.infinity,
        height: 50,
        // alignment: Alignment.centerLeft,
        //  color: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(3.0, 5.0),
                  blurRadius: 7)
            ]),
        //transform: Matrix4.identity()..scale(0.5)..translate(150.0,-100.0),
        width: double.infinity,
        height: 50,
        //color: Colors.pink,
        alignment: Alignment.center,
        child: Text(
          "Toque aqui",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ButtonTextIConLocal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(3.0, 5.0),
                    blurRadius: 7)
              ]),
          width: double.infinity,
          height: 50,
          // alignment: Alignment.centerLeft,
          //  color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.whatshot,
                  color: Colors.white,
                ),
              ),
              // SizedBox(width: 20,),
              Expanded(
                flex: 3,
                child: Text(
                  "Toque Aqui",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          )),
    );
  }
}

class StackHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.black,
          height: 300,
        ),
        Container(
          color: Colors.blue,
          height: 300,
        ),
      ],
    );
  }
}
