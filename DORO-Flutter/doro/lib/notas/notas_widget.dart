import 'dart:convert';
import 'package:doro/notas/note.dart';
import 'package:flutter/material.dart';
import '../home_page/home_page_widget.dart';
import 'package:get_storage/get_storage.dart';

class NotasWidget extends StatefulWidget {
  const NotasWidget({Key key}) : super(key: key);

  @override
  _NotasWidgetState createState() => _NotasWidgetState();
}

class _NotasWidgetState extends State<NotasWidget> {
  final box = GetStorage();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<TextEditingController> titles = <TextEditingController>[];
  List<TextEditingController> descriptions = <TextEditingController>[];

  _NotasWidgetState() {
    readSavedData();
  }

  void readSavedData() {
    var value = box.read('titles');
    print(value);
    if (value != null) {
      List<String> temp_titles = value.split(',');
      temp_titles.removeLast();
      titles.clear();
      for (var i = 0; i < temp_titles.length; i++) {
        titles.add(TextEditingController(text: temp_titles[i]));
      }
    }
    value = box.read('descriptions');
    print(value);
    if (value != null) {
      List<String> temp_descriptions = value.split(',');
      temp_descriptions.removeLast();
      descriptions.clear();
      for (var i = 0; i < temp_descriptions.length; i++) {
        descriptions.add(TextEditingController(text: temp_descriptions[i]));
      }
    }
  }

  //leer guardado
  readWithGetStorage(String storageKey) => box.read(storageKey);

  //guardar
  saveListWithGetStorage(String storageKey, List<dynamic> storageValue) async =>
      await box.write(storageKey, jsonEncode(storageValue));

  createAlertDialog(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('¿Quieres eliminar esta nota?'),
            actions: <Widget>[
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Sí'),
                onPressed: () {
                  deleteNoteToList(index);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void saveNotes() {
    String titlesString = '';
    String descriptionsString = '';
    for (int i = 0; i < titles.length; i++) {
      titlesString += titles[i].text + ',';
      descriptionsString += descriptions[i].text + ',';
    }
    box.remove('titles');
    box.remove('descriptions');
    box.write('titles', titlesString);
    box.write('descriptions', descriptionsString);
  }

  void deleteNoteToList(int index) {
    setState(() {
      titles.removeAt(index);
      descriptions.removeAt(index);
      saveNotes();
      readSavedData();
    });
  }

  void addNoteToList() {
    setState(() {
      titles.add(new TextEditingController(text: ''));
      descriptions.add(new TextEditingController(text: ''));
      titles.last.addListener(() {
        saveNotes();
      });
      saveNotes();
      readSavedData();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: HomePageWidget.colorOver,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 32,
          ),
          color: Colors.white,
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notas',
          style: TextStyle(
            fontFamily: 'Orelega One',
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: HomePageWidget.colorOver,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNoteToList();
        },
        backgroundColor: HomePageWidget.colorBackground,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: titles.length,
                  itemBuilder: (BuildContext context, int index) {
                    final title = titles[index];
                    return Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HomePageWidget.colorOver,
                      ),
                      child: GestureDetector(
                        onHorizontalDragEnd: (DragEndDetails details) {
                          if (details.primaryVelocity > 1000) {
                            createAlertDialog(context, index);
                          }
                        },
                        // onLongPress: () {
                        //   deleteNoteToList(index);
                        // },
                        child: note(
                            titles[index], descriptions[index], saveNotes,
                            key: ObjectKey(title)),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
