import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                boxShadow: [BoxShadow(color: Colors.black)]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "rafael_vasconcelos",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.history),
                      iconSize: 30,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.dehaze),
                      iconSize: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "12",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                Text(" Visitas ao perfil nos últimos 7 dias"),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 0.3,
            color: Colors.black,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.3,
            //color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.red,
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 5,
                      child: Stack(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.black,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 70),
                              child: Container(
                                height: 30,
                                alignment: Alignment.bottomRight,
                                child: FloatingActionButton(
                                  child: Icon(Icons.add),
                                  backgroundColor: Colors.yellow,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
