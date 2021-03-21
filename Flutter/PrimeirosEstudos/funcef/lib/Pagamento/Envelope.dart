import 'package:flutter/material.dart';
import 'package:funcef/Pagamento/dtoEnvelope.dart';

class EnvelopePagamento extends StatefulWidget {
  @override
  _EnvelopePagamentoState createState() => _EnvelopePagamentoState();
}

class _EnvelopePagamentoState extends State<EnvelopePagamento> {
  List<Envelope> envelopes;

@override
  void initState() {
  envelopes = Envelope.getEnvelope();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Container(
            child: DataTable(
      columns: [
        DataColumn(label: Text('Mês'), numeric: false),
        DataColumn(label: Text('Valor Bruto')),
        DataColumn(label: Text('Valor Líquido')),
      ],
      rows: envelopes.map(
        (envelope) {
          DataRow(cells: [
            DataCell(
              Text(envelope.mes),
            ),
            DataCell(
              Text(envelope.valorBruto),
            ),
            DataCell(
              Text(envelope.valorLiquido),
            ),
          ]);
        },
      ).toList(),
    )));
  }
}
