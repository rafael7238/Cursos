import 'package:flutter/material.dart';
import 'package:smarthome/urls.dart' as link;

class CloudsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            link.nuvem,
            height: 20,
          ),
          Image.network(link.nuvem, height: 30),
        ],
      ),
    );
  }
}
