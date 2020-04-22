import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/urls.dart' as link;

class CardWidget extends StatefulWidget {
  final String imgUrl;
  final String title;

  const CardWidget({
    Key key,
    this.imgUrl,
    this.title,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  Color get customColor => Theme.of(context).primaryColor.withAlpha(120);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: Material(
          child: Row(
            children: [
              Expanded(
                  child: Image.network(
                widget.imgUrl,
                fit: BoxFit.cover,
              )),
              Expanded(
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Online",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: customColor)),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 2,
                          color: customColor,
                          width: double.infinity,
                        ),
                        Text("Alarming",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: customColor)),
                        CupertinoSwitch(
                          value: false,
                          onChanged: (_) {},
                          trackColor: Theme.of(context).dividerColor,
                          activeColor: Theme.of(context).accentColor,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
