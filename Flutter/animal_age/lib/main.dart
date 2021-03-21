import 'package:animal_age/Cat/Cat.dart';
import 'package:animal_age/Dog/Dog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Home/Home.dart';

void main() {
  runApp(MaterialApp(
    title: "Animal Age",
    debugShowCheckedModeBanner: false,
    home:Home(),
  ));
}