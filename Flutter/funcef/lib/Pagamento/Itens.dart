import 'package:flutter/material.dart';
import 'package:funcef/Global/SubMenus.dart';
import 'package:funcef/Pagamento/Envelope.dart';
import 'package:funcef/Pagamento/provider/providerPageController.dart';

class ItensPagamento extends StatefulWidget {
  @override
  _ItensPagamentoState createState() => _ItensPagamentoState();
}

class _ItensPagamentoState extends State<ItensPagamento> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15,right: 15),
      child: Column(      
        children: <Widget>[
          SizedBox(height: 20),
          subMenus(Icon(Icons.drafts), "Envelope de Pagamento"),
          SizedBox(height: 20),
          subMenus(Icon(Icons.input), "Informe de Rendimento")
        ],
      ),
    );
  }
}
