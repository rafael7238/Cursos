import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class Dog extends StatefulWidget {
  @override
  _DogState createState() => _DogState();
}

enum SingingCharacter { pequeno, medio, grande, gigante }

class _DogState extends State<Dog> {
  SingingCharacter _character = SingingCharacter.pequeno;
  String _resultado = "";
  int idade = 0;
  DateTime _dataNascimento;


  void Calcular() {

    if (_dataNascimento == null) {
      setState(() {
        _resultado = "Birth is null";
      });
      return;
}

    var Perc24Meses = 0.0;
    var PercMais24Meses=0.0;

    if (_character == SingingCharacter.pequeno) {
      Perc24Meses = 12.5;
      PercMais24Meses=4.5;
    }
    if (_character == SingingCharacter.medio) {
       Perc24Meses = 10.5;
       PercMais24Meses=6.0;
    }
    if (_character == SingingCharacter.grande ||
        _character == SingingCharacter.gigante) {
      Perc24Meses = 12.5;
      PercMais24Meses=9.0;
    }

    Perc24Meses = Perc24Meses / 12;
    PercMais24Meses = PercMais24Meses/12;

    var dias = DateTime.now().difference(_dataNascimento).inDays;
    var meses = (dias / 30).truncate();
    var Anos = 0.0;

    if (meses < 1) {
      setState(() {
        _resultado="Dog less than a month old";
      });
      return;
    }
    if (meses >= 1 && meses <= 24) {
      Anos = meses * Perc24Meses;
      setState(() {
        _resultado="Age: ${Anos.truncate().toString()}";
      });
      return;
    }

      Anos = 24 * Perc24Meses;
      meses = meses - 24;
      var aux = meses * PercMais24Meses;
      Anos = Anos + aux;

    setState(() {
      _resultado = "Age: ${Anos.truncate().toString()}";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dog"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'Approximate Date of Birth',
                ),
                mode: DateTimeFieldPickerMode.date,
                autovalidateMode: AutovalidateMode.always,
                onDateSelected: (DateTime value) {
                  setState(() {
                    _dataNascimento = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  children: [
                    Text(
                      "Animal Weight: ",
                      style: TextStyle(fontSize: 25.0),
                    ),
                    RadioList("Until 10kg", SingingCharacter.pequeno),
                    RadioList("Between 11kg and 25kg", SingingCharacter.medio),
                    RadioList("Between 25kg and 45kg", SingingCharacter.grande),
                    RadioList("Bigger than 46kg", SingingCharacter.gigante),
                  ],
                ), /*DropdownButton(
                  value: _selectedCompany,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),*/
              ),
              ElevatedButton(
                onPressed: Calcular,
                child: Text("Calculate",style: TextStyle(
                  fontSize: 20.0
                ),),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    _resultado,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  Widget RadioList(String titulo, SingingCharacter caracter) {
    return ListTile(
      title: Text(titulo),
      leading: Radio(
        value: caracter,
        groupValue: _character,
        onChanged: (SingingCharacter value) {
          setState(() {
            _character = value;
            print(value);
          });
        },
      ),
    );
  }
}
