import 'dart:async';
import 'package:doro/home_page/chat_list.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart';
import '../functions/functions.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  static String State = 'Inactivo';
  static String gifPath = 'assets/images/lofi-browsing.gif';
  static Color colorBackground = Color(0xFF1C161A);
  static Color colorOver = Color(0xFF454545);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState(25, 5);
}

class _HomePageWidgetState extends State<HomePageWidget> {
  Icon butIcon = Icon(Icons.play_arrow);
  int pomocont = 0;
  int pomoStu;
  int pomoDes;
  Timer countdownTimer;
  Duration myDuration;
  int seconds;
  List<Color> punts = [
    Color(0x4B000000),
    Color(0x4B000000),
    Color(0x4B000000),
    Color(0x4B000000)
  ];
  _HomePageWidgetState(this.pomoStu, this.pomoDes) {
    myDuration = Duration(minutes: pomoStu);
    seconds = myDuration.inSeconds;
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes: pomoStu));
  }

  void setCountDown() {
    // print(1 - myDuration.inSeconds / 120);
    final reduceSecondsBy = 1;
    setState(() {
      final seconds2 = myDuration.inSeconds - reduceSecondsBy;
      if (seconds2 < 0) {
        countdownTimer.cancel();
        if (rYouStudying(HomePageWidget.State)) {
          if (pomocont < 4) {
            punts[pomocont] = Colors.black;
            pomocont++;
            myDuration = Duration(minutes: pomoDes);
          } else {
            pomocont = 0;
            myDuration = Duration(minutes: pomoStu);
          }
          //activar punto
          //cambiar gif
          HomePageWidget.gifPath = 'assets/images/resting.gif';
          //cambiar color
          HomePageWidget.colorBackground = Color(0xFF12654F);
          HomePageWidget.colorOver = Color(0xFF307473);
          //cambiar estado
          HomePageWidget.State = 'Descansando';
          seconds = myDuration.inSeconds;
        } else {
          myDuration = Duration(minutes: pomoStu);
          //cambiar gif
          HomePageWidget.gifPath = 'assets/images/lofi-browsing.gif';
          //cambiar color
          HomePageWidget.colorBackground = Color(0xFF1C161A);
          HomePageWidget.colorOver = Color(0xFF454545);
          //cambiar estado
          HomePageWidget.State = 'Estudiando';
          seconds = myDuration.inSeconds;
        }

        //inciar contador
        startTimer();
      } else {
        myDuration = Duration(seconds: seconds2);
      }
    });
  }

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
                  resetTimer();
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
                  Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                      width: double.infinity,
                      height: 225,
                      decoration: BoxDecoration(
                        color: HomePageWidget.colorOver,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional(0, 0),
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    HomePageWidget.gifPath,
                                    width: double.infinity,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  // The text border
                                  Text(
                                    HomePageWidget.State,
                                    style: TextStyle(
                                      fontFamily: 'Orelega one',
                                      fontSize: 40,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 1.5
                                        ..color = Color(0xff292929),
                                    ),
                                  ),
                                  // The text inside
                                  Text(
                                    HomePageWidget.State,
                                    style: TextStyle(
                                      fontFamily: 'Orelega one',
                                      color: Color(0x98FFFFFF),
                                      fontSize: 40,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(120, 0, 120, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: punts[0],
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: punts[1],
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: punts[2],
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: punts[3],
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.0, right: 20.0),
                            width: double.infinity,
                            child: LinearPercentIndicator(
                              percent: 1 - (myDuration.inSeconds / seconds),
                              // width: 500,
                              animation: false,
                              lineHeight: 10,
                              progressColor: Colors.black,
                              backgroundColor: Color(0x4D000000),
                              barRadius: Radius.circular(25),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  chat_list()
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
                      pomocont = 0;
                      // put clock on
                      startTimer();

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
