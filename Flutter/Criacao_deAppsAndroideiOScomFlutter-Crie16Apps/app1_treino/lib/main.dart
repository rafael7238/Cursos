import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _qtdMulheres = 0, _qtdHomens = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      color: Colors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total de Mulheres:",
              style: TextStyle(fontSize: 15.0),
            ),
            Text(
              "Total de Homens: ",
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "$_qtdMulheres",
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                "$_qtdHomens",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ),
        Text("Total "),
        Text(totalMulhereseHomens(_qtdMulheres, _qtdHomens).toString()),
        Padding(
          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.network(
                    "https://image.flaticon.com/icons/png/512/180/180678.png",
                    height: 50,
                    width: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        child: Text("+"),
                        onPressed: () {
                          atualizaMulher(1);
                        },
                        color: Colors.white,
                      ),
                      RaisedButton(
                        child: Text("-"),
                        onPressed: () {
                          atualizaMulher(-1);
                        },
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Image.network(
                    "https://icons-for-free.com/iconfiles/png/512/boy+guy+man+icon-1320166733913205010.png",
                    height: 50,
                    width: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        child: Text("+"),
                        onPressed: () {
                          atualizaHomen(1);
                        },
                        color: Colors.white,
                      ),
                      RaisedButton(
                        child: Text("-"),
                        onPressed: () {
                          atualizaHomen(-1);
                        },
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void atualizaMulher(int valor) {
    setState(() {
      _qtdMulheres = _qtdMulheres + valor;
    });
  }

  void atualizaHomen(int valor) {
    setState(() {
      _qtdHomens = _qtdHomens + valor;
    });
  }
}

int totalMulhereseHomens(int qtdM, int qtdH) {
  return qtdM + qtdH;
}
