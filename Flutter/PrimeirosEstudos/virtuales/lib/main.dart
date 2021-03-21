import 'package:flutter/material.dart';
import 'package:virtuales/cursos.dart';
import 'package:virtuales/funcoes/func.dart';
import 'package:virtuales/listar_curso.dart';
import 'variaveis/var.dart';

String url = "";

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Map>> listaCurso;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    listaCurso = recuperarDocumento();
    
  }

  Widget categorias(int i) {
    return Text(listaCategora[i].toString());
  }

  String categoriasText(int i) {
    return listaCategora[i].toString();
  }

  void _rota(String item) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new Listar(item,listaCurso)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Categorias',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: categorias(0),
              onTap: () => _rota(categoriasText(0)),
            ),
            ListTile(
              title: categorias(1),
              onTap: () => _rota(categoriasText(1)),
            ),
            ListTile(
              title: categorias(2),
              onTap: () => _rota(categoriasText(2)),
            ),
            ListTile(
              title: categorias(3),
              onTap: () => _rota(categoriasText(3)),
            ),
            ListTile(
              title: categorias(4),
              onTap: () => _rota(categoriasText(4)),
            ),
            ListTile(
              title: categorias(5),
              onTap: () => _rota(categoriasText(5)),
            ),
            ListTile(
              title: categorias(6),
              onTap: () => _rota(categoriasText(6)),
            ),
            ListTile(
              title: categorias(7),
              onTap: () => _rota(categoriasText(7)),
            ),
            ListTile(
              title: categorias(8),
              onTap: () => _rota(categoriasText(8)),
            ),
            ListTile(
              title: categorias(9),
              onTap: () => _rota(categoriasText(9)),
            ),
            ListTile(
              title: categorias(10),
              onTap: () => _rota(categoriasText(10)),
            ),
            ListTile(
              title: categorias(11),
              onTap: () => _rota(categoriasText(11)),
            ),
            ListTile(
              title: categorias(12),
              onTap: () => _rota(categoriasText(12)),
            ),
            ListTile(
              title: categorias(13),
              onTap: () => _rota(categoriasText(13)),
            ),
            ListTile(
              title: categorias(14),
              onTap: () => _rota(categoriasText(14)),
            ),
            ListTile(
              title: categorias(15),
              onTap: () => _rota(categoriasText(15)),
            ),
            ListTile(
              title: categorias(16),
              onTap: () => _rota(categoriasText(16)),
            ),
            ListTile(
              title: categorias(17),
              onTap: () => _rota(categoriasText(17)),
            ),
            ListTile(
              title: categorias(18),
              onTap: () => _rota(categoriasText(18)),
            ),
            ListTile(
              title: categorias(19),
              onTap: () => _rota(categoriasText(19)),
            ),
            ListTile(
              title: categorias(20),
              onTap: () => _rota(categoriasText(20)),
            ),
            ListTile(
              title: categorias(21),
              onTap: () => _rota(categoriasText(21)),
            ),
            ListTile(
              title: categorias(22),
              onTap: () => _rota(categoriasText(22)),
            ),
            ListTile(
              title: categorias(23),
              onTap: () => _rota(categoriasText(23)),
            ),
            ListTile(
              title: categorias(24),
              onTap: () => _rota(categoriasText(24)),
            ),
            ListTile(
              title: categorias(25),
              onTap: () => _rota(categoriasText(25)),
            ),
            ListTile(
              title: categorias(26),
              onTap: () => _rota(categoriasText(26)),
            ),
            ListTile(
              title: categorias(27),
              onTap: () => _rota(categoriasText(27)),
            ),
            ListTile(
              title: categorias(28),
              onTap: () => _rota(categoriasText(28)),
            ),
            ListTile(
              title: categorias(29),
              onTap: () => _rota(categoriasText(29)),
            ),
            ListTile(
              title: categorias(30),
              onTap: () => _rota(categoriasText(30)),
            ),
            ListTile(
              title: categorias(31),
              onTap: () => _rota(categoriasText(31)),
            ),
            ListTile(
              title: categorias(32),
              onTap: () => _rota(categoriasText(32)),
            ),
            ListTile(
              title: categorias(33),
              onTap: () => _rota(categoriasText(33)),
            ),
            ListTile(
              title: categorias(34),
              onTap: () => _rota(categoriasText(34)),
            ),
            ListTile(
              title: categorias(35),
              onTap: () => _rota(categoriasText(35)),
            ),
            ListTile(
              title: categorias(36),
              onTap: () => _rota(categoriasText(36)),
            ),
            ListTile(
              title: categorias(37),
              onTap: () => _rota(categoriasText(37)),
            ),
            ListTile(
              title: categorias(38),
              onTap: () => _rota(categoriasText(38)),
            ),
            ListTile(
              title: categorias(39),
              onTap: () => _rota(categoriasText(39)),
            ),
            ListTile(
              title: categorias(40),
              onTap: () => _rota(categoriasText(40)),
            ),
            ListTile(
              title: categorias(41),
              onTap: () => _rota(categoriasText(41)),
            ),
            ListTile(
              title: categorias(42),
              onTap: () => _rota(categoriasText(42)),
            ),
            ListTile(
              title: categorias(43),
              onTap: () => _rota(categoriasText(43)),
            ),
            ListTile(
              title: categorias(44),
              onTap: () => _rota(categoriasText(44)),
            ),
            ListTile(
              title: categorias(45),
              onTap: () => _rota(categoriasText(45)),
            ),
            ListTile(
              title: categorias(46),
              onTap: () => _rota(categoriasText(46)),
            ),
          ],
        ),
      ),
      body: Container(
          //padding: EdgeInsets.all(16),
          child: GridView.count(
        // Cria um grid com duas colunas
        crossAxisCount: 2,
        // Gera 100 Widgets que exibem o seu índice
        children: List.generate(listaCategora.length, (index) {
          return Center(
            child: GestureDetector(
              onTap: () => _rota(listaCategora[index]),
              child: Column(
                children: <Widget>[
                  Container(
                    child:
                        Image.asset("images/" + listaCategora[index] + ".jpg"),
                    height: 100,
                  ),
                  Text(
                    listaCategora[index],
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }),
      )),
    );
  }
}
