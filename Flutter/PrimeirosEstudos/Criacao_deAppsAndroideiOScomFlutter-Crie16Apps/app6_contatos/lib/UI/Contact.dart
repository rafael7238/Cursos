import 'dart:io';

import 'package:app6_contatos/Helpers/contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;
  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _nameFocus = FocusNode();
  File _image;
  final picker = ImagePicker();

  bool _edited = false;
  Contact _editedContact;

  @override
  void initState() {
    super.initState();
    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());
      _emailController.text = _editedContact.email;
      _telefoneController.text = _editedContact.phone;
      _nameController.text = _editedContact.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(_editedContact.name ?? "Novo Contato"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
          onPressed: () {
            if (_editedContact.name != null) {
              Navigator.pop(context, _editedContact);
            } else {
              FocusScope.of(context).requestFocus(_nameFocus);
            }
          },
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              GestureDetector(
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: // _editedContact.img == null ?
                                NetworkImage(
                                    "https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg")
                            //  : FileImage(File(_editedContact.img))

                            )),
                  ),
                  onTap:
                      getImage /*() {


                  ImagePicker.pickImage(source: ImageSource.camera)
                      .then((value) {
                    if (value == null)
                      return;
                    else {
                      setState(() {
                        _editedContact.img = File(value.path).path;
                      });
                    }
                  });
                },*/
                  ),
              TextField(
                focusNode: _nameFocus,
                controller: _nameController,
                decoration: InputDecoration(labelText: "Nome"),
                onChanged: (value) {
                  _edited = true;
                  setState(() {
                    _editedContact.name = value;
                  });
                },
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "E-mail"),
                onChanged: (value) {
                  setState(() {
                    _editedContact.email = value;
                  });
                },
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: "Telefone"),
                onChanged: (value) {
                  setState(() {
                    _editedContact.phone = value;
                  });
                },
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_edited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar Alterações"),
              content: Text("Se sair as alterações serão perdidas"),
              actions: [
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
      return Future.value(true);
    } else {
      return Future.value(true);
    }
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile.path == null) return;
    _image = File(pickedFile.path);
    setState(() {
      _editedContact.img = _image.path;
    });
  }
}
