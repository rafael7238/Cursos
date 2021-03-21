import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  Function({String text, File imgFile}) sendMessage;
  TextComposer(this.sendMessage);

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () async {
              final picker = ImagePicker();
              final pickedFile =
                  await picker.getImage(source: ImageSource.camera);

              if (pickedFile?.path == null) return;

              final image = File(pickedFile.path);

              widget.sendMessage(imgFile: image);
            },
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration:
                  InputDecoration.collapsed(hintText: "Enviar uma mensagem"),
              onChanged: (value) {
                setState(() {
                  _isComposing = value.isNotEmpty;
                });
              },
              onSubmitted: (value) {
                widget.sendMessage(text: value);
                _messageController.clear();
                setState(() {
                  _isComposing = false;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing
                ? () {
                    widget.sendMessage(text: _messageController.text);
                    _messageController.clear();
                    setState(() {
                      _isComposing = false;
                    });
                  }
                : null,
          )
        ],
      ),
    );
  }
}
