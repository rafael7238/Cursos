import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller;

  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  void dispose() {
    super.dispose();
    controller.dispose();
  }

  List<String> paginas = ["Home", "Favorito", "Conta"];

  List<Widget> pages = [
    Center(child: Text("Page 1")),
    Center(child: Text("Page 2")),
    Center(child: Text("Page 3")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PageView"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.bounceIn);
                }),
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  controller.jumpTo(0);
                }),
            IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.bounceIn);
                }),
          ],
        ),
        body: PageView.builder(
            controller: controller,
            itemCount: pages.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(child: Text(paginas[index]));
            }),
        bottomNavigationBar: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget child) {
            return BottomNavigationBar(
              onTap: (index) {
                controller.animateToPage(index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInSine);
                print("$index");
              },
              currentIndex: controller.page.round(),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    title: Text("Home"), icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    title: Text("Favoritos"), icon: Icon(Icons.favorite)),
                BottomNavigationBarItem(
                    title: Text("Conta"), icon: Icon(Icons.account_box)),
              ],
            );
          },
        )
        /*PageView(
        physics: ScrollPhysics(),
        onPageChanged: (pageInt){
          print(pageInt);
        },
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Center(child: Text("Page 1")),
          Center(child: Text("Page 2")),
          Center(child: Text("Page 3"))
        ],
      ),*/
        );
  }
}
