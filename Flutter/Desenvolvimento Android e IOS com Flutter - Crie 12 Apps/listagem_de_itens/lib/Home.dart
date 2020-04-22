import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List lista = ["Jamilton", "Maria", "João", "Caria"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Widget")),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              final item = lista[index];
              return Dismissible(
                background: Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[Icon(Icons.edit, color: Colors.white)],
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[Icon(Icons.delete, color: Colors.white)],
                  ),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {}
                  setState(() {
                   lista.removeAt(index);
                  });
                },
                direction: DismissDirection.horizontal,
                key: Key(item),
                child: ListTile(
                  title: Text(item),
                ),
              );
            }),
      ),
    );
  }
}
