import 'package:flutter/material.dart';

Widget menuLateral() {
  return Drawer(
    child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            child: Text("MA"),
          ),
          accountName: Text("Maria Almeida"),
          accountEmail: Text("mariaalmeida@gmail.com"),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("Account"),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Notification"),
        ),
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text("Exit"),
        ),
      ],
    ),
  );
}
