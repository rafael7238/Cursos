import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wheel test"),
      ),
      backgroundColor: Colors.red,
      body: ListWheelScrollView.useDelegate(
        //perspective: 0.0099,
        itemExtent: 100.0,
      //  clipToSize: true,
    //    diameterRatio: 1.0,
        magnification: 2,
     //   overAndUnderCenterOpacity: 1,
        offAxisFraction: 0.1,
        useMagnifier: true,
       // physics: PageScrollPhysics(),
        onSelectedItemChanged: (i) => print("Changed $i"),
        renderChildrenOutsideViewport: false,
        //squeeze: 1.5,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            if (index <= 10 && index>0 )  {
              return Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width / 9,
                child: ListTile(
                  title: Text(index.toString()),
                  //trailing: Icon(Icons.home),
                ),
              );
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
