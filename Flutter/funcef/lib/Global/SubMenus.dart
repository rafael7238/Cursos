import 'package:flutter/material.dart';

class subMenus extends StatefulWidget {
  Icon icone;
  String texto;
  subMenus(this.icone, this.texto);

  @override
  _subMenusState createState() => _subMenusState();
}

class _subMenusState extends State<subMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(      
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Row(
          children: <Widget>[
            widget.icone,
            Text("      "+widget.texto),
          ],
        ),
      ),
    );
  }
}
