import 'package:encontrelive/titulo.dart';
import 'package:flutter/material.dart';
import 'package:calendar_strip/calendar_strip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

void main() async {
  runApp(MyApp());
  // await _getInformacoes();
}

//class Company {
// int id;
// String name;

//  Company(this.id, this.name);

//}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Encontre Live',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Encontre Live'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Titulo> _lista = List<Titulo>();
  List<Titulo> _listaFiltrada = List<Titulo>();
  List<String> _listaCategorias = List<String>();
  List<String> _distinctCategorias = List<String>();
  String _selectedLocation; // Option 2

  bool textCopy = false;

  _getListaFiltrada() {
    _listaFiltrada.clear();
    String d = dataReal.day.toString() +
        '_' +
        dataReal.month.toString().padLeft(2, '0') +
        '_' +
        dataReal.year.toString();

    setState(() {
      _listaFiltrada.clear();

      if (_selectedLocation == null ||
          _selectedLocation == 'Todas Categorias') {
        _lista.forEach((element) {
          if (element.data == d) {
            _listaFiltrada.add(element);
          }
        });
      } else {
        _lista.forEach((element) {
          if (element.data == d && element.categoria == _selectedLocation) {
            _listaFiltrada.add(element);
          }
        });
      }
    });

    _getListaCategorias();
    _ordenarLista();
  }

  _ordenarLista() {
    setState(() {
      _listaFiltrada.sort((a, b) {
        if (int.parse(a.hora) < int.parse(b.hora))
          return 0;
        else if (int.parse(a.hora) == int.parse(b.hora) &&
            int.parse(a.minuto) < int.parse(b.minuto)) {
          return 0;
        } else
          return 1;
      });
    });
  }

  _getInformacoes() async {
    QuerySnapshot snapshot =
        await Firestore.instance.collection('teste').getDocuments();

    _lista.clear();
    snapshot.documents.forEach((element) {
      //print(element.data.toString() + element.documentID);

      Titulo t = Titulo();
      t.data = element.data['Data'];
      t.artista = element.data['Artista'];
      t.categoria = element.data['Categoria'];
      t.hora = element.data['Hora'];
      t.informacoes = element.data['Informações'];
      t.instagram = element.data['Instagram'];
      t.link = element.data['Link'];
      t.youtube = element.data['Youtube'];
      t.minuto = element.data['Minuto'];
      setState(() {
        _lista.add(t);
      });
    });

    _getListaFiltrada();
  }

  _getListaCategorias() {
    _listaCategorias.clear();
    _listaCategorias.add("Todas Categorias");
    setState(() {
      _lista.forEach((element) {
        _listaCategorias.add(element.categoria);
      });
      _distinctCategorias = _listaCategorias.toSet().toList();
    });
  }

  @override
  initState() {
    super.initState();
    _getInformacoes();
  }

  DateTime startDate = DateTime.now().subtract(Duration(days: 0));
  DateTime endDate = DateTime.now().add(Duration(days: 30));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 2));

  DateTime dataReal = DateTime.now().subtract(Duration(days: 0));

  onSelect(DateTime data) {
    //   print("Selected Date -> $data");
    setState(() {
      dataReal = data;
    });
    _getListaFiltrada();
  }

  _monthNameWidget(String monthName) {
    if (monthName.contains("January")) {
      monthName = monthName.replaceAll("January", "Janeiro");
    }
    if (monthName.contains("February")) {
      monthName = monthName.replaceAll("February", "Fevereio");
    }
    if (monthName.contains("March")) {
      monthName = monthName.replaceAll("March", "Março");
    }
    if (monthName.contains("April")) {
      monthName = monthName.replaceAll("April", "Abril");
    }
    if (monthName.contains("May")) {
      monthName = monthName.replaceAll("May", "Maio");
    }
    if (monthName.contains("June")) {
      monthName = monthName.replaceAll("June", "Junho");
    }
    if (monthName.contains("July")) {
      monthName = monthName.replaceAll("July", "Julho");
    }
    if (monthName.contains("August")) {
      monthName = monthName.replaceAll("August", "Agosto");
    }
    if (monthName.contains("September")) {
      monthName = monthName.replaceAll("September", "Setembro");
    }
    if (monthName.contains("October")) {
      monthName = monthName.replaceAll("October", "Outubro");
    }
    if (monthName.contains("November")) {
      monthName = monthName.replaceAll("November", "Novembro");
    }
    if (monthName.contains("December")) {
      monthName = monthName.replaceAll("December", "Dezembro");
    }

    return Container(
      child: Text(monthName,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontStyle: FontStyle.italic)),
      padding: EdgeInsets.only(top: 8, bottom: 4),
    );
  }

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
    TextStyle normalStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black87);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);

    switch (dayName) {
      case "Sun":
        dayName = "Dom";
        break;
      case "Mon":
        dayName = "Seg";
        break;
      case "Tue":
        dayName = "Ter";
        break;
      case "Wed":
        dayName = "Qua";
        break;
      case "Thr":
        dayName = "Qui";
        break;
      case "Fri":
        dayName = "Sex";
        break;
      case "Sat":
        dayName = "Sáb";
        break;
    }

    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _getInformacoes),
        ],
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          CalendarStrip(
            startDate: startDate,
            endDate: endDate,
            onDateSelected: onSelect,
            dateTileBuilder: dateTileBuilder,
            iconColor: Colors.black87,
            monthNameWidget: _monthNameWidget,
            containerDecoration: BoxDecoration(color: Colors.black12),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new DropdownButton<String>(
                hint:
                    Text('Selecione a Categoria'), // Not necessary for Option 1
                value: _selectedLocation,
                onChanged: (newValue) {
                  setState(() {
                    _selectedLocation = newValue;
                    _getListaFiltrada();
                  });
                },
                items: _distinctCategorias.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(
                      value,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                //value: "Teste",
              )
            ],
          ),
          Divider(),          
          Expanded(
              child: ListView.builder(
                  itemCount: _listaFiltrada.length,
                  itemBuilder: (context, index) {
                    Titulo tt = Titulo();
                    tt = _listaFiltrada[index];

                    //  if (tt.data == d) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Link Original"),
                                      IconButton(
                                        alignment: Alignment.bottomRight,
                                        icon: Icon(Icons.share),
                                        onPressed: () {
                                          Share.share(tt.link.toString());
                                        },
                                      )
                                    ],
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Flexible(child: Text(tt.link)),
                                      IconButton(
                                        icon: Icon(Icons.content_copy),
                                        onPressed: () {
                                          Clipboard.setData(
                                              new ClipboardData(text: tt.link));
                                          _scaffoldKey.currentState
                                              .showSnackBar(SnackBar(
                                            content: Text('Link Copiado'),
                                            duration: Duration(seconds: 2),
                                          ));
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Cancelar"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        leading: Image.asset(
                          tt.instagram
                              ? "images/instagram.jpg"
                              : 'images/youtube.jpg',
                          height: 50,
                          width: 50,
                        ),
                        title: Text(tt.artista),
                        subtitle: Text('Horário: ' + tt.hora + ':' + tt.minuto),
                        trailing: Icon(Icons.more_vert),
                      ),
                    );

                    //  }
                    //     else return null;
                  })),
        ],
      )),
    );
  }
}
