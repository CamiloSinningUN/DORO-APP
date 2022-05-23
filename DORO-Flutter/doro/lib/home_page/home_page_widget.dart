import 'package:doro/home_page/chat_list.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart';
import '../home_page/top_card.dart';
import '../functions/functions.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  static String State = 'Inactivo';
  static String gifPath = 'assets/images/lofi-browsing.gif';
  static Color colorBackground = Color(0xFF1C161A);
  static Color colorOver = Color(0xFF454545);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  Icon butIcon = Icon(Icons.play_arrow);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('¿Quieres dejar de estudiar?'),
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
                  Navigator.of(context).pop();
                  // Cambiar estado (texto)
                  HomePageWidget.State = 'Inactivo';
                  // Cambiar gif
                  HomePageWidget.gifPath = 'assets/images/lofi-browsing.gif';
                  // Cambiar colores
                  HomePageWidget.colorBackground = Color(0xFF1C161A);
                  HomePageWidget.colorOver = Color(0xFF454545);
                  // change play icon
                  butIcon = Icon(Icons.play_arrow);
                  // put clock off
                  setState(() {});
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: HomePageWidget.colorBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).push(createNotas());
        },
        backgroundColor: HomePageWidget.colorBackground,
        elevation: 8,
        child: Icon(
          Icons.sticky_note_2_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  top_card(),
                  chat_list(),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 245, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    if (!rYouStudying(HomePageWidget.State)) {
                      // Cambiar estado (texto)
                      HomePageWidget.State = 'Estudiando';
                      // Cambiar gif
                      HomePageWidget.gifPath = 'assets/images/studying.gif';
                      // Cambiar colores
                      HomePageWidget.colorBackground = Color(0xFF12654F);
                      HomePageWidget.colorOver = Color(0xFF307473);
                      // change play icon
                      butIcon = Icon(Icons.pause);
                      // put clock on
                      setState(() {});
                    } else {
                      createAlertDialog(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: Color(0xFF028577),
                    padding: EdgeInsets.all(15),
                  ),
                  child: Icon(
                    butIcon.icon,
                    size: 32,
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
