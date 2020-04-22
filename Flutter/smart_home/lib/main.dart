import 'package:flutter/material.dart';
import 'package:smarthome/home_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Color(0xFF3F4FA5),
        accentColor: Color(0xFFFE6491),
        dividerColor: Color(0xFF),
        visualDensity: VisualDensity.adaptivePlatformDensity),
    home: HomePage(),
  ));
}
