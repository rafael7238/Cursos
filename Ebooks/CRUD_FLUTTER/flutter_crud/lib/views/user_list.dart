import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_title.dart';
import 'package:flutter_crud/data/dummy_users.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuários"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, index) {
          return UserTitle(user.values.elementAt(index));
        },
      ),
    );
  }
}
