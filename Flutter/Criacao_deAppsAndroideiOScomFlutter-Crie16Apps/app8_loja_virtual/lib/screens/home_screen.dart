import 'package:app8lojavirtual/tabs/home_tab.dart';
import 'package:app8lojavirtual/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageViewController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageViewController),
        ),
        Scaffold(
            body: Container(
              color: Colors.red,
            ),
            drawer: CustomDrawer(_pageViewController)),
        Scaffold(
            body: Container(
              color: Colors.blue,
            ),
            drawer: CustomDrawer(_pageViewController)),
        Scaffold(
            body: Container(
              color: Colors.pink,
            ),
            drawer: CustomDrawer(_pageViewController))
      ],
    );
  }
}
