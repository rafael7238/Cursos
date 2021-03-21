import 'dart:io';

import 'package:app7_chat_online_firebase/textComposer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Map<String, dynamic> data = {};

  void _sendMessage({String text, File imgFile}) async {
    if (imgFile != null) {
      StorageUploadTask task = await FirebaseStorage.instance
          .ref()
          .child(DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(imgFile);

      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();
      data["imgUrl"] = url;
      print(url);
    }
    if (text != null) {
      data["text"] = text;
    }
    Firestore.instance.collection("messages").document().setData(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olá"),
        elevation: 0,
      ),
      body: TextComposer(_sendMessage),
    );
  }
}
