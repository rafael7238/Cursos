import 'dart:io';

import 'package:app6agendadecontatos/helpers/contact_helpers.dart';
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
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;
  Contact _editedContact;

  @override
  void initState() {
    super.initState();
    if (widget.contact == null)
      _editedContact = Contact();
    else {
      _editedContact = Contact.fromMap(widget.contact.toMap());
      _nameController.text = _editedContact.nome;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(_editedContact.nome ?? "Novo Contato"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:  _editedContact.img != null
                        ? FileImage(File(_editedContact.img)) :
                       AssetImage("images/person.png")),
                      
                  ),
                ),
                onTap: () {
                  ImagePicker.pickImage(source: ImageSource.camera)
                      .then((value) {
                    if (value == null) return;
                    setState(() {
                      _editedContact.img = value.path;
                    });
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Nome",
                ),
                controller: _nameController,
                focusNode: _nameFocus,
                keyboardType: TextInputType.text,
                onChanged: (text) {
                  _userEdited = true;
                  setState(() {
                    _editedContact.nome = text;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (text) {
                  _userEdited = true;

                  _editedContact.email = text;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Phone",
                ),
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                onChanged: (text) {
                  _userEdited = true;

                  _editedContact.phone = text;
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_editedContact.nome != null && _editedContact.nome != "")
              Navigator.pop(context, _editedContact);
            else {
              FocusScope.of(context).requestFocus(_nameFocus);
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text("Se sair as aleterações serão perdidas."),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar"),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("Sim"),
                ),
              ],
            );
          });
      return Future.value(false);
    } else
      return Future.value(true);
  }
}
