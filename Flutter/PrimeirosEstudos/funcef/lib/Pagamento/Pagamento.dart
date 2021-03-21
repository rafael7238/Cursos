import 'package:flutter/material.dart';
import 'package:funcef/Pagamento/Envelope.dart';
import 'package:funcef/Pagamento/Informe.dart';
import 'package:funcef/Pagamento/Itens.dart';

class Pagamento extends StatefulWidget {
  @override
  _PagamentoState createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  PageController controller;

  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  void dispose() {
    super.dispose();
    controller.dispose();
  }

  List<Widget> pages = [ItensPagamento(), EnvelopePagamento(),Informe()];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: PageView.builder(
            controller: controller,
            itemCount: pages.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(child: pages[index]);
            }),
      ),
    );
  }
}
