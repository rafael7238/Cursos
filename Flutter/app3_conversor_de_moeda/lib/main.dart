import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

import 'Home.dart';

void main() async {
  print(DateTime.now());

  runApp(MaterialApp(
    home: Home(),
  ));
  print(DateTime.now());
}
