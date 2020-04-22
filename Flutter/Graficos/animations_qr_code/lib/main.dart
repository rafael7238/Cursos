import 'package:animations_qr_code/pages/PlaneTicketListPage.dart';
import 'package:animations_qr_code/theme.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: PlaneTicketListPage(),
    );
  }
}
