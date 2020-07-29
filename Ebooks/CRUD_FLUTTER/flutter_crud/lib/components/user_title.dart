import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';

class UserTitle extends StatelessWidget {
  final User user;
  const UserTitle(this.user);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          Icons.person,
        ),
        
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100.0,
        child: Row(
          children: [
            IconButton(icon:Icon(Icons.edit), color: Colors.orange,onPressed: () {  },),
            IconButton(icon:Icon(Icons.delete), color: Colors.red,onPressed: () {  },)
          ],
        ),
      ),
    );
  }
}
