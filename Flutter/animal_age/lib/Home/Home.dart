import 'package:animal_age/Cat/Cat.dart';
import 'package:animal_age/Dog/Dog.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose the Aninal"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cat()));
              },
              child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: new AssetImage(
                              "images/cat.PNG")
                      )),
                  //child: Image.asset("images/cat.PNG",)
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dog()));
              },
              child: Container(
                  padding: EdgeInsets.only(top: 10.0),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: new AssetImage(
                              "images/dog.PNG")
                      )),
                  //child: Image.asset("images/dog.PNG")
              ),
            ),
          ],
        ),
      ),
    );
  }
}
