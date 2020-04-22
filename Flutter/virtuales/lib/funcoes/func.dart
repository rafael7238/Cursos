import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:virtuales/variaveis/var.dart';

Future<List<Map>> recuperarDocumento() async {
 List<Map> _listaCurso =[] ;

  Firestore db = Firestore.instance;

  for (var i in listaCategora) {
    QuerySnapshot query = await db.collection(i).getDocuments();
    for (var item in query.documents) {
      Map valor = Map();
      valor["Categoria"] = i;
      valor["Descricao"] = item.data["Descricao"];
      valor["Nome"] = item.data["Nome"];
      valor["Link"] = item.data["Link"];
      valor["Imagem"] = item.data["Imagem"];

      _listaCurso.add(valor);

      // print(item.documentID + " - " + item.data["Link"]);

    }
    print(i);
  }
  return _listaCurso;
}
