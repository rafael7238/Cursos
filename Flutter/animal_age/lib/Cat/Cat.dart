import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class Cat extends StatefulWidget {
  @override
  _CatState createState() => _CatState();
}

class _CatState extends State<Cat> {
  String _resultado = "";
  int idade = 0;
  DateTime _dataNascimento;
  String SingingCharacter = "";

  void Calcular() {
    if (_dataNascimento == null) {
      setState(() {
        _resultado = "Birth is null";
      });
      return;
    }

    var dias = DateTime.now().difference(_dataNascimento).inDays;
    var meses = (dias / 30).truncate();
    var Anos = 0.0;

    if (meses <= 6)
      SingingCharacter = "Kitten";
    else if (meses <= 24)
      SingingCharacter = "Junior";
    else if (meses <= 72)
      SingingCharacter = "Adult";
    else if (meses <= 120)
      SingingCharacter = "Mature";
    else if (meses <= 168)
      SingingCharacter = "Senior";
    else if (meses > 300) SingingCharacter = "Super Senior";

    if (meses < 1)
      _resultado = "Cat less than a month old";
    else if (meses > 0 && meses < 2)
      _resultado = "1 years";
    else if (meses == 2)
      _resultado = "2 years";
    else if (meses == 3)
      _resultado = "4 years";
    else if (meses == 4)
      _resultado = "6 years";
    else if (meses == 5)
      _resultado = "8 years";
    else if (meses == 6)
      _resultado = "10 years";
    else if (meses > 6 && meses < 12)
      _resultado = " Between 12 and 15 years";
    else if (meses >= 12 && meses < 18)
      _resultado = "Between 15 and 21 years";
    else if (meses >= 18 && meses < 24)
      _resultado = "Between 21 and 24 years";
    else if (meses >= 24 && meses < 36)
      _resultado = "Between 24 and 28 years";
    else if (meses >= 6 && meses < 48)
      _resultado = "Between 28 and 32 years";
    else if (meses >= 6 && meses <= 60)
      _resultado = "Between 32 and 36 years";
    else if (meses >= 6 && meses <= 72)
      _resultado = "Between 36 and 40 years";
    else if (meses >= 6 && meses <= 84)
      _resultado = "Between 40 years";
    else if (meses >= 84 && meses < 96)
      _resultado = "Between 44 and 48 years";
    else if (meses >= 96 && meses < 108)
      _resultado = "Between 48 and 52 years";
    else if (meses >= 108 && meses < 120)
      _resultado = "Between 52 and 56 years";
    else if (meses >= 120 && meses < 132)
      _resultado = "Between 56 years";
    else if (meses >= 132 && meses < 144)
      _resultado = "Between 60 and 64 years";
    else if (meses >= 144 && meses < 156)
      _resultado = "Between 64 and 68 years";
    else if (meses >= 156 && meses < 168)
      _resultado = "Between 68 and 72 years";
    else if (meses >= 168 && meses < 180)
      _resultado = "Between 72 and 76 years";
    else if (meses >= 180 && meses < 192)
      _resultado = "Between 76 and 80 years";
    else if (meses >= 192 && meses < 204)
      _resultado = "Between 80 and 84 years";
    else if (meses >= 204 && meses < 216)
      _resultado = "Between 84 and 88 years";
    else if (meses >= 216 && meses < 228)
      _resultado = "Between 88 and 92 years";
    else if (meses >= 228 && meses < 240)
      _resultado = "Between 92 and 96 years";
    else if (meses >= 240 && meses < 252)
      _resultado = "Between 96 and 100 years";
    else if (meses >= 252 && meses < 264)
      _resultado = "Between 100 and 104 years";
    else if (meses >= 264 && meses < 276)
      _resultado = "Between 104 and 108 years";
    else if (meses >= 276 && meses < 288)
      _resultado = "Between 108 and 112 years";
    else if (meses >= 288 && meses < 300)
      _resultado = "Between 112 and 116 years";
    else if (meses >= 300) _resultado = "Bigger than 116 years";

    setState(() {
      _resultado = "Age: $_resultado . \n Life Stage: $SingingCharacter";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cat"),
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
            ElevatedButton(
              onPressed: Calcular,
              child: Text(
                "Calculate",
                style: TextStyle(fontSize: 20.0),
              ),
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
}
