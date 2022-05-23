import 'package:doro/notas/note.dart';
import 'package:flutter/material.dart';
import '../home_page/home_page_widget.dart';

class NotasWidget extends StatefulWidget {
  const NotasWidget({Key key}) : super(key: key);

  @override
  _NotasWidgetState createState() => _NotasWidgetState();
}

class _NotasWidgetState extends State<NotasWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> titles = <String>['Titulo 1', 'Titulo 2'];
  final List<String> descriptions = <String>['Descripcion 1', 'Descripcion 2'];

  @override
  void initState() {
    super.initState();
  }

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

  void deleteNoteToList(int index) {
    titles.removeAt(index);
    descriptions.removeAt(index);
    print(titles);
    setState(() {});
  }

  void addNoteToList() {
    setState(() {
      titles.add('Titulo');
      descriptions.add('Descripcion');
    });
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
                        child: note(TextEditingController(text: titles[index]),
                            TextEditingController(text: descriptions[index]),
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
