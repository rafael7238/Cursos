class Envelope {
  String mes;
  String valorBruto;
  String valorLiquido;

  Envelope({this.mes, this.valorBruto, this.valorLiquido});

  static List<Envelope> getEnvelope() {
    return <Envelope>[
      Envelope(mes: "2019/01", valorBruto: "1000", valorLiquido: "84894"),
      Envelope(mes: "2019/02", valorBruto: "648648", valorLiquido: "6464"),
      Envelope(mes: "2019/03", valorBruto: "46498", valorLiquido: "564646"),
      Envelope(mes: "2019/04", valorBruto: "45877", valorLiquido: "564564"),
    ];
  }
}