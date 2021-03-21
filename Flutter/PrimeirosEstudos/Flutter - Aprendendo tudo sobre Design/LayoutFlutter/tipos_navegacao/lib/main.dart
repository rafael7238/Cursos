import 'package:flutter/material.dart';
import 'package:tipos_navegacao/CustomDrawer.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Navegação"),
      ),
      body: Container(),
    ),
  ));
}
