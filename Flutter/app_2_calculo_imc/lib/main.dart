import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Contador de Pessoa",
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController pesoController = new TextEditingController();
  TextEditingController alturaController = new TextEditingController();

String _infoStart = "Insira seus dados";

  void _resetField(){
    pesoController.text="";
    alturaController.text="";
    setState(() {
      _infoStart = "Insira seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _Calculate(){
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text);
    altura = altura/100;
    double resultado = peso/(altura*altura);
    setState(() {
      _infoStart="O Resultado foi: ${resultado.toStringAsPrecision(3)}";

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [IconButton(icon: Icon(Icons.refresh), onPressed: _resetField)],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10.0,right: 10.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.perm_identity_rounded,
                size: 120,
                color: Colors.green,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormFieldComponent(pesoController,'Peso em (KG)'),
                    TextFormFieldComponent(alturaController,'Altura em (CM)'),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10.0),
                      child: Container(
                        height: 50.0,
                       // padding: EdgeInsets.only(bottom: 10.0,top: 10.0),
                        child: ElevatedButton(

                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.green),
                            ),
                            onPressed: () {

                              if (_formKey.currentState.validate()) {
                                _Calculate();
                                // If the form is valid, display a Snackbar.
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            },
                            child: Text(
                              "Calcular",
                              style: TextStyle(color: Colors.white, fontSize: 20.0),
                            )),
                      ),
                    ),
                    Text(_infoStart,textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.green,fontSize: 25.0
                    ),),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



Widget TextFormFieldComponent(TextEditingController control,String label){
  return new TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.green)),
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.green, fontSize: 25.0),
    controller: control,
    // The validator receives the text that the user has entered.
    validator: (value) {
      if (value.isEmpty) {
        return 'Insira o valor do campo';

      }
      return null;
    },
  );
}