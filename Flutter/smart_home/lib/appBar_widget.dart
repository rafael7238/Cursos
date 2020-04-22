import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              "https://i.imgur.com/NftgmKv.png",
              width: 25,
            ),
            Icon(
              Icons.menu,
              size: 35.0,
              color: Theme.of(context).primaryIconTheme.color,
            )
          ],
        ),
      ),
    );
  }
}
