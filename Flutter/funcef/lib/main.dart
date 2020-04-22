import 'package:flutter/material.dart';
import 'package:funcef/Ferias/Ferias.dart';
import 'package:funcef/Home.dart';
import 'package:funcef/Inicial/Inicial.dart';
import 'package:funcef/Login/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.blue,
      ),
    home: Home(),
    );
  }
}