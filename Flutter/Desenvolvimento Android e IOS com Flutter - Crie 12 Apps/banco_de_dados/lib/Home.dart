import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarBancoDeDados() async {
    final caminhoBancoDeDados = await getDatabasesPath();
    final localBancoDeDados = join(caminhoBancoDeDados, "banco.db");

    var bd = await openDatabase(localBancoDeDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE usuarios (id integer primary key autoincrement, nome varchar,idade integer) ";
      db.execute(sql);
    });

    return bd;
    // print(bd.isOpen.toString());
  }

  _salvar() async {
    Database bd = await _recuperarBancoDeDados();
    Map<String, dynamic> dadosUsuarios = {"nome": "Carlos", "idade": 46};

    int id = await bd.insert("usuarios", dadosUsuarios);
    print(id);
  }

  _listarUsuarios() async {
    Database bd = await _recuperarBancoDeDados();

    String sql = "SELECT * FROM usuarios";
    List usuarios = await bd.rawQuery(sql);

    for (var usuario in usuarios) {
      print("Item Id:" + usuario['id'].toString());
      print("Nome :" + usuario['nome']);
      print("Nome :" + usuario['idade'].toString());
    }
    // print("Usuarios: "+usuarios.toString() );
  }

  _recuperarUsuarioPeloId(int id) async {
    Database db = await _recuperarBancoDeDados();
    List usuarios = await db.query("usuarios",
        columns: ["id", "nome", "idade"], where: "id=?", whereArgs: [id]);

    for (var usuario in usuarios) {
      print("Item Id:" + usuario['id'].toString());
      print("Nome :" + usuario['nome']);
      print("Nome :" + usuario['idade'].toString());
    }
  }

  _excluirUsuario() async {
    Database db = await _recuperarBancoDeDados();
    db.delete("usuarios", where: "id>=5");
  }

  _atualizaDados(int id) async {
    Database db = await _recuperarBancoDeDados();
    Map<String, dynamic> dadosUsuarios = {"nome": "Rafael", "idade": 26};
    db.update("usuarios", dadosUsuarios,where: "id=1");
  }

  @override
  Widget build(BuildContext context) {
    // _recuperarBancoDeDados();
    //_salvar();
    _atualizaDados(1);
    _recuperarUsuarioPeloId(1);

    return Container();
  }
}
