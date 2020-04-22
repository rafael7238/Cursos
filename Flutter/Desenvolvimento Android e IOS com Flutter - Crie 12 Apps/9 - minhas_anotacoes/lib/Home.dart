import 'package:flutter/material.dart';
import 'package:minhas_anotacoes/helper/AnotacaoHelper.dart';
import 'package:minhas_anotacoes/model/Anotacao.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  var _db = AnotacaoHelper();

  List<Anotacao> _anotacoes = List<Anotacao>();

  _exibirTelaCadastro({Anotacao anotacao}) {
    String textoSalvarAtualizar = "";
    if (anotacao == null) {
      _tituloController.text = "";
      _descController.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      _tituloController.text = anotacao.titulo;
      _descController.text = anotacao.descricao;

      textoSalvarAtualizar = "Atualizar";
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" ${textoSalvarAtualizar} Anotação"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _tituloController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Título", hintText: "Digíte título..."),
                ),
                TextField(
                  controller: _descController,
                  decoration: InputDecoration(
                      labelText: "Descrição", hintText: "Digíte Descrição..."),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancelar"),
              ),
              FlatButton(
                onPressed: () {
                  _salvarAnotacao(anotacaoSelecionada: anotacao);
                  Navigator.pop(context);
                },
                child: Text(textoSalvarAtualizar),
              ),
            ],
          );
        });
  }

  _salvarAnotacao({Anotacao anotacaoSelecionada}) async {
    String titulo = _tituloController.text;
    String descricao = _descController.text;
    int resultado = 0;
    if (anotacaoSelecionada == null) {
      Anotacao anotacao =
          Anotacao(titulo, descricao, DateTime.now().toString());
      resultado = await _db.salvarAnotacao(anotacao);
    } else {
      anotacaoSelecionada.titulo = titulo;
      anotacaoSelecionada.descricao = descricao;
      anotacaoSelecionada.data = DateTime.now().toString();
      resultado = await _db.atualizarAnotacao(anotacaoSelecionada);
    }

    print(resultado);
    _tituloController.clear();
    _descController.clear();

    _recuperarAnotacoes();
  }

  _recuperarAnotacoes() async {
    _anotacoes.clear();

    List anotacoesRecuperadas = await _db.recuperarAnotacoes();
    List<Anotacao> listaTemporaria = List<Anotacao>();

    for (var item in anotacoesRecuperadas) {
      Anotacao anotacao = Anotacao.fromMap(item);
      listaTemporaria.add(anotacao);
    }
    setState(() {
      _anotacoes = listaTemporaria;
    });
    listaTemporaria = null;

    print(anotacoesRecuperadas.toString());
  }

  _formatarData(String data) {
    initializeDateFormatting("pt_BR");
    var formatador = DateFormat("dd/MM/yyyy");
    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);
    return dataFormatada;
  }

  _removerAnotacao(int id) async {
    await _db.removerAnotacao(id);
    _recuperarAnotacoes();
  }

  @override
  void initState() {
    super.initState();
    _recuperarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas anotações"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _anotacoes.length,
              itemBuilder: (context, index) {
                final anotacao = _anotacoes[index];

                return Card(
                  child: ListTile(
                    title: Text(anotacao.titulo),
                    subtitle: Text(
                        "${_formatarData(anotacao.data)} - ${anotacao.descricao} "),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _exibirTelaCadastro(anotacao: anotacao);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _removerAnotacao(anotacao.id);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          _exibirTelaCadastro();
        },
      ),
    );
  }
}
