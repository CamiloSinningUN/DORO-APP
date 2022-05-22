import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class NotasWidget extends StatefulWidget {
  const NotasWidget({Key key}) : super(key: key);

  @override
  _NotasWidgetState createState() => _NotasWidgetState();
}

class _NotasWidgetState extends State<NotasWidget> {
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
              builder: (context) => HomePageWidget(),
            ),
            // PageTransition(
            //   type: PageTransitionType.leftToRight,
            //   duration: Duration(milliseconds: 150),
            //   reverseDuration: Duration(milliseconds: 150),
            //   child: HomePageWidget(),
            // ),
          );
        },
        backgroundColor: Color(0xFF1C161A),
        elevation: 8,
        child: Icon(
          Icons.chat_outlined,
          color: Colors.white,
          size: 24,
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/lofi-browsing.gif',
                              width: 290,
                              height: 144,
                              fit: BoxFit.cover,
                            ),
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
                      // child: FlutterFlowIconButton(
                      //   borderColor: Colors.transparent,
                      //   borderRadius: 30,
                      //   borderWidth: 1,
                      //   buttonSize: 60,
                      //   fillColor: Color(0xFF028577),
                      //   icon: Icon(
                      //     Icons.play_arrow,
                      //     color: Colors.white,
                      //     size: 30,
                      //   ),
                      //   onPressed: () {
                      //     print('IconButton pressed ...');
                      //   },
                      // ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF454545),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                'Notas',
                                textAlign: TextAlign.center,
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyText1
                                //     .override(
                                //       fontFamily: 'Orelega One',
                                //       color: Color(0xB5FFFFFF),
                                //       fontSize: 45,
                                //       fontWeight: FontWeight.normal,
                                //       useGoogleFonts: false,
                                //     ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              // child: FlutterFlowIconButton(
                              //   borderColor: Colors.transparent,
                              //   borderRadius: 0,
                              //   borderWidth: 0,
                              //   buttonSize: 50,
                              //   icon: Icon(
                              //     Icons.add_box,
                              //     color: Color(0xCEFFFFFF),
                              //     size: 30,
                              //   ),
                              //   onPressed: () {
                              //     print('IconButton pressed ...');
                              //   },
                              // ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0x38030303),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: Text(
                                          'Hello World',
                                          textAlign: TextAlign.start,
                                          // style: FlutterFlowTheme.of(context)
                                          //     .bodyText1
                                          //     .override(
                                          //       fontFamily: 'Orelega One',
                                          //       color: Color(0xFFFCFCFC),
                                          //       fontSize: 20,
                                          //       fontWeight: FontWeight.normal,
                                          //       useGoogleFonts: false,
                                          //     ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: Text(
                                          'Hello World',
                                          // style: FlutterFlowTheme.of(context)
                                          //     .bodyText1
                                          //     .override(
                                          //       fontFamily: 'Orelega One',
                                          //       color: Color(0xCBFFFFFF),
                                          //       fontSize: 20,
                                          //       fontWeight: FontWeight.normal,
                                          //       useGoogleFonts: false,
                                          //     ),
                                        ),
                                      ),
                                    ],
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
