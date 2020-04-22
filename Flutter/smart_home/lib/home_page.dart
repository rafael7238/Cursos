import 'package:flutter/material.dart';
import 'package:smarthome/appBar_widget.dart';
import 'package:smarthome/cloud_widget.dart';
import 'package:smarthome/pageview_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
          child: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: AspectRatio(
                  aspectRatio: 1.2, //1.0
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: -MediaQuery.of(context).size.width / 3,
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 3,
                          backgroundColor: Theme.of(context).accentColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.5, 1],
                        colors: [Color(0xFFf3f5f9), Colors.white])),
              )
            ],
          ),
          CloudsWidget(),
          AppBarWidget(),
          SafeArea(
            child: Column(
              children: [
                DefaultTextStyle(
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText1
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w300),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        25, MediaQuery.of(context).size.width / 4, 25, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(text: "Stan´s \n"),
                          TextSpan(
                              text: "office",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w800))
                        ])),
                        Text(
                          "23° indoor \n closed",
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          PageViewWidget()
        ]),
      ),
    );
  }
}
