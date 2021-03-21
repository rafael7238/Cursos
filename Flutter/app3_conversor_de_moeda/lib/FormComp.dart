import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget inputDecoration(
    String label, String prefix, TextEditingController control, Function f) {
  return TextField(
    onChanged: f,
    controller: control,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    style: TextStyle(color: Colors.amber, fontSize: 25.0),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: Colors.amber,
      ),
      prefix: Text("$prefix\$ "),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
      hintStyle: TextStyle(
        color: Colors.amber,
      ),
    ),
  );
}
