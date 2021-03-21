import 'package:flutter/material.dart';
import 'package:navegacao_entre_telas/Home.dart';
import 'package:navegacao_entre_telas/SecondWidget.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      primarySwatch: Colors.purple
    ),
  ));
}