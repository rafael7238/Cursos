import 'package:flutter/material.dart';
import 'package:smarthome/card_widget.dart';
import 'package:smarthome/urls.dart' as link;

class PageViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AspectRatio(
            aspectRatio: 2,
            child: PageView(
              children: [
                CardWidget(
                  imgUrl: link.luminaria,
                  title :"Gatway"
                ),
                Container(
                  height: 25,
                )
              ],
            ))
      ],
    );
  }
}
