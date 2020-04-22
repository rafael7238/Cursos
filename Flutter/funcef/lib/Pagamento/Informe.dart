import 'package:flutter/material.dart';
import 'package:funcef/Global/SubMenus.dart';

class Informe extends StatefulWidget {
  @override
  _InformeState createState() => _InformeState();
}

class _InformeState extends State<Informe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:subMenus(Icon(Icons.file_download), "2018"),
    );
  }
}