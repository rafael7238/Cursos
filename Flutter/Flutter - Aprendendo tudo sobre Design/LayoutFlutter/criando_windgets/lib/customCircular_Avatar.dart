import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customCircular extends StatelessWidget {


  final double size;
  final Widget child;
  final Color backgroundColor;

  const customCircular({Key key, this.size = 40, this.backgroundColor=Colors.white, this.child=null}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
            alignment: Alignment.center,
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(40)
            ),
            child: child 
          );
  }
}