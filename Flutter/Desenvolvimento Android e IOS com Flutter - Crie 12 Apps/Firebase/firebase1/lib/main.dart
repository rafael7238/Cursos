import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

/********Cria e altera um documento *******/

//  Firestore.instance
//  .collection("usuarios")
//  .document("pontuacao")
//  .setData({"Nome":"Rafael","Idade":27,"Solterio":true});

  // Firestore db = Firestore.instance;

/********Cria um documento com o código gerado automárico um documento *******/

  // var ref =
  // await db.collection("usuarios").add({"Nome": "Rafael", "Idade": 30});s
  // print(ref.documentID);

/********Altera um documento *******/

  //db.collection("usuarios")
  //.document("N2hNCHky1a6RxcWsiZx1")
  //.setData({"Nome": "Lucas", "Idade": 20});
  //*/

/********Exclui um documento *******/

  //db.collection("usuarios")
  //document("pontuacao").delete();

/********Recupera um documento *******/

//DocumentSnapshot snapshot = await db.collection("usuarios")
//            .document("pontuacao").get();

//  print(snapshot.data);
//  print(snapshot["Solterio"]);

/********Recupera todos os documentos da coleção *******/

  //QuerySnapshot query = await db.collection("usuarios").getDocuments();
  //print(query.documents);

  //for (var item in query.documents) {
  //  print(item.documentID + " - " + item.data.toString()+ " - "+item.data["Nome"]);
  //}

  /********Recupera todos os documentos da coleção em tempo real *******/

  //db.collection("usuarios").snapshots().listen((snapshot) {
  //  for (var item in snapshot.documents) {
  //    print(item.documentID + " - " + item.data.toString() +" - " + item.data["Nome"]);
  //  }
  //});

  /********Filtro dos Dados *******/

  // var query = await db.collection("usuarios")
  // .where("Nome",isEqualTo: "Rafael")
  // .where('Solterio',isEqualTo: true)
  // .getDocuments();

  //  for (var item in query.documents) {
  //   print(item.documentID + " - " + item.data.toString() +" - " + item.data["Nome"]);
  //}

  //FirebaseAuth auth = FirebaseAuth.instance;

  //String email = "rafael7238@hotmail.com";
  //String senha = "123456";

  /********Criação do usuário *******/

  // auth.createUserWithEmailAndPassword(email: email, password: senha).then((firebaseUser) {
  //  print("O novo e-mail foi cadastrado" + firebaseUser.user.email);
  //}).catchError((onErros) {
  //  print("Erro ao cadastrar o e-mail" + onErros.toString());
  //});

  /********LogOut do usuário *******/

  //auth.signOut();

  /********Login do usuário *******/

  //var teste = await auth.signInWithEmailAndPassword(email: email, password: senha).then((firebaseUser) {
  //   print("O novo e-mail foi cadastrado" + firebaseUser.user.email);
  // }).catchError((onErros) {
  //   print("Erro ao cadastrar o e-mail" + onErros.toString());
  // });

  // FirebaseUser usuarioLogado = await auth.currentUser();
  // if (usuarioLogado != null) {
  //   print(usuarioLogado.email);
  // } else {
  //   print("Ninguém está logado");
  // }

  runApp(MaterialApp(home: MyhApp()));
}

class MyhApp extends StatefulWidget {
  @override
  _MyhAppState createState() => _MyhAppState();
}

class _MyhAppState extends State<MyhApp> {
  String _uploadEmProgresso = "";
  String _url = "";
  File _image;

  Future _carregarFoto(bool isCamera) async {
    var image;

    if (isCamera)
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    else
      image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future _upLoad() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();
    StorageReference arquivo = pastaRaiz.child("fotos").child("foto1.png");

    StorageUploadTask task = arquivo.putFile(_image);

    task.events.listen((StorageTaskEvent storageEvent) {
      if (storageEvent.type == StorageTaskEventType.progress) {
        setState(() {
          _uploadEmProgresso = "Em Progresso...";
        });
      } else if (storageEvent.type == StorageTaskEventType.success) {
        setState(() {
          _uploadEmProgresso = "Upload efetuado com sucesso.";
        });
      }
    });

    /**************Recuperar URL da imagem ***************/

    task.onComplete.then((StorageTaskSnapshot snapshot) {
      _recuperarImagemUrl(snapshot);
    });
  }

  Future _recuperarImagemUrl(StorageTaskSnapshot snapshot) async {
    String url = await snapshot.ref.getDownloadURL();
    setState(() {
      _url = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionar uma imagem"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(_uploadEmProgresso),
            RaisedButton(
              child: Text("Galeria"),
              onPressed: () {
                _carregarFoto(false);
              },
            ),
            RaisedButton(
              child: Text("Camêra"),
              onPressed: () {
                _carregarFoto(true);
              },
            ),
            _image == null ? Container() : Image.file(_image),
            _image == null
                ? Container()
                : RaisedButton(
                    child: Text("Upload"),
                    onPressed: () {
                      _upLoad();
                    },
                  ),
            _url == "" ? Container() : Image.network(_url)
          ],
        ),
      ),
    );
  }
}
