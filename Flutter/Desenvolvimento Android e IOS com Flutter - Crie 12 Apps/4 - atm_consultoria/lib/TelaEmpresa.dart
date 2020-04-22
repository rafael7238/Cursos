import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Empresa"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("images/detalhe_empresa.png"),
                  Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Sobre a Empresa",
                          style: TextStyle(
                              fontSize: 20, color: Colors.deepOrange)))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae massa risus. Mauris commodo sapien vel neque aliquet congue. Curabitur pulvinar mi id libero interdum ornare. Duis malesuada velit non lacus hendrerit elementum. Mauris quis est orci. In maximus, massa ut venenatis rutrum, odio nulla rutrum velit, molestie scelerisque ex turpis eget ante. Fusce fringilla arcu eu volutpat volutpat. Vestibulum tempor, purus vel vulputate bibendum, dui massa bibendum turpis, a sagittis nisl est at massa. Nullam felis mauris, congue quis ipsum vel, interdum sollicitudin mauris. Pellentesque elementum, metus eget faucibus blandit, ligula risus rutrum velit, in pellentesque quam orci vitae erat. Aenean nibh felis, accumsan imperdiet sapien eget, blandit posuere nunc. Aliquam posuere velit in est varius, non lacinia ipsum cursus. Praesent nulla nisi, fringilla et velit ac, mattis mattis lectus. Nam porttitor dui eget velit posuere, in facilisis arcu eleifend. Aenean consectetur bibendum odio non gravida. Donec eleifend imperdiet eros id dictum. Vivamus congue nibh sed leo aliquam vestibulum. Ut nec egestas sem. Nam vel faucibus arcu, ut interdum lorem. Vivamus a orci nec tortor vulputate luctus eget et urna. Donec malesuada lectus nisl, eget sagittis sem porttitor dapibus. Pellentesque mi dolor, dictum eget pharetra at, vestibulum eu quam. In non mauris suscipit, vehicula felis ac, imperdiet diam. Aenean pretium consequat aliquam. Donec sem mauris, porta at elementum et, commodo sed ligula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris fringilla pharetra pulvinar. Phasellus mollis vel dui ac venenatis. Etiam venenatis tempor augue ut sollicitudin. In sodales faucibus aliquet. Etiam non metus sed arcu volutpat consectetur. Pellentesque pretium risus eu hendrerit efficitur. Vivamus in arcu vel nisl porta bibendum eget id purus. Quisque dui tellus, pulvinar eu ornare id, mattis in nisl. Morbi ut nisl nec erat euismod tincidunt viverra nec erat."))
            ],
          ),
        ),
      ),
    );
  }
}
