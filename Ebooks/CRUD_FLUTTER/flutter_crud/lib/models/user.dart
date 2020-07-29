import 'package:flutter/cupertino.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String avatarURl;

 const User({this.id, @required this.name, this.email, this.avatarURl});
}
