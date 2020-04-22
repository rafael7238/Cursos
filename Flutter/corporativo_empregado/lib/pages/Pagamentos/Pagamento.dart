import 'package:corporativo_empregado/pages/Pagamentos/nestedTabBarView.dart';
import 'package:flutter/material.dart';

class Pagamento extends StatefulWidget {
  @override
  _PagamentoState createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: NestedTabBar(),
      ),
    );
  }
}
