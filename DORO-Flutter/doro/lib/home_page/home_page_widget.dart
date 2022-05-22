import '../chat/chat_widget.dart';
// import '../flutter_flow/flutter_flow_icon_button.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
import '../notas/notas_widget.dart';
// import '../custom_code/actions/index.dart' as actions;
// import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1C161A),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotasWidget(),
            ),
            // PageTransition(
            //   type: PageTransitionType.rightToLeft,
            //   duration: Duration(milliseconds: 150),
            //   reverseDuration: Duration(milliseconds: 150),
            //   child: NotasWidget(),
            // ),
          );
        },
        backgroundColor: Color(0xFF1C161A),
        elevation: 8,
        child: Icon(
          Icons.sticky_note_2_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: Container(
                      width: 328,
                      height: 221,
                      decoration: BoxDecoration(
                        color: Color(0xFF454545),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional(0, 0),
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/lofi-browsing.gif',
                                  width: 290,
                                  height: 144,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Text('Inactivo'
                              //     // valueOrDefault<String>(
                              //     //   FFAppState().MyState,
                              //     //   'inactivo',
                              //     // ),
                              //     // style: FlutterFlowTheme.of(context).bodyText1.override(
                              //     //   fontFamily: 'Orelega one',
                              //     //   color: Color(0x98FFFFFF),
                              //     //   fontSize: 40,
                              //     //   fontWeight: FontWeight.normal,
                              //     // ),
                              //     ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(100, 0, 100, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Color(0x4B000000),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Color(0x4B000000),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Color(0x4B000000),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Color(0x4B000000),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: LinearPercentIndicator(
                                  percent: 0,
                                  width: 274,
                                  lineHeight: 10,
                                  animation: true,
                                  progressColor: Colors.black,
                                  backgroundColor: Color(0x4D000000),
                                  barRadius: Radius.circular(25),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFF028577),
                        child: IconButton(
                          icon: const Icon(
                            Icons.play_arrow,
                            size: 30,
                          ),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      // onPressed: () async {
                      //   if (functions.rYouStudying(valueOrDefault<String>(
                      //     FFAppState().MyState,
                      //     'inactivo',
                      //   ))) {
                      //     await actions.fromBlankToInactive();
                      //   } else {
                      //     await actions.fromInactiveToStudying();
                      //   }
                      // },
                      // ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF454545),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                            child: Text(
                              'Chats',
                              style: TextStyle(
                                fontFamily: 'Orelega one',
                                color: Color(0xB5FFFFFF),
                                fontSize: 40,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1.5,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(80, 0, 0, 0),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: double.infinity,
                            ),
                            decoration: BoxDecoration(),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    Navigator.of(context).push(_createChat());
                                    // await Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => ChatWidget(),
                                    //   ),
                                    //   // PageTransition(
                                    //   //   type: PageTransitionType.leftToRight,
                                    //   //   duration: Duration(milliseconds: 150),
                                    //   //   reverseDuration:
                                    //   //       Duration(milliseconds: 150),
                                    //   //   child: ChatWidget(),
                                    //   // ),
                                    // );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://picsum.photos/seed/907/600',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 2.5),
                                              child: Text(
                                                'Maria UN',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Orelega One',
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Hola',
                                              style: TextStyle(
                                                fontFamily: 'Orelega One',
                                                color: Color(0xB6FFFFFF),
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createChat() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const ChatWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
