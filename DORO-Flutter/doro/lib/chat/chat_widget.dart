import '../home_page/home_page_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key key}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF12654F),
        automaticallyImplyLeading: false,
        // leading: FlutterFlowIconButton(
        //   borderColor: Colors.transparent,
        //   borderRadius: 30,
        //   borderWidth: 1,
        //   buttonSize: 60,
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.white,
        //     size: 30,
        //   ),
        //   onPressed: () async {
        //     await Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //       builder: (context) => HomePageWidget(),
        //       ),
        //       // PageTransition(
        //       //   type: PageTransitionType.rightToLeft,
        //       //   duration: Duration(milliseconds: 150),
        //       //   reverseDuration: Duration(milliseconds: 150),
        //       //   child: HomePageWidget(),
        //       // ),
        //     );
        //   },
        // ),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                'https://picsum.photos/seed/165/600',
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                    child: Text(
                      'Maria UN',
                      textAlign: TextAlign.start,
                      // style: FlutterFlowTheme.of(context).bodyText1.override(
                      //       fontFamily: 'Orelega One',
                      //       color: Colors.white,
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.normal,
                      //       useGoogleFonts: false,
                      //     ),
                    ),
                  ),
                  Text(
                    'Estudiando',
                    // style: FlutterFlowTheme.of(context).bodyText1.override(
                    //       fontFamily: 'Orelega One',
                    //       color: Color(0xD8FFFFFF),
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.normal,
                    //       useGoogleFonts: false,
                    //     ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFF1C161A),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFC4C4C4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
                        child: Text(
                          'Hello World',
                          // style:
                          //     FlutterFlowTheme.of(context).bodyText1.override(
                          //           fontFamily: 'Orelega One',
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.normal,
                          //           useGoogleFonts: false,
                          //         ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
                        child: Text(
                          'Hello World',
                          // style:
                          //     FlutterFlowTheme.of(context).bodyText1.override(
                          //           fontFamily: 'Orelega One',
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.normal,
                          //           useGoogleFonts: false,
                          //         ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: TextFormField(
                        controller: textController,
                        onChanged: (_) => EasyDebounce.debounce(
                          'textController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Escribe aquí...',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Color(0xCD454545),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        ),
                        // style: FlutterFlowTheme.of(context).bodyText1.override(
                        //       fontFamily: 'Orelega One',
                        //       color: Color(0xCAFFFFFF),
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.normal,
                        //       useGoogleFonts: false,
                        //     ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  // FlutterFlowIconButton(
                  //   borderColor: Colors.transparent,
                  //   borderRadius: 10,
                  //   borderWidth: 1,
                  //   buttonSize: 50,
                  //   fillColor: Color(0xCC454545),
                  //   icon: Icon(
                  //     Icons.send,
                  //     color: Colors.white,
                  //     size: 30,
                  //   ),
                  //   onPressed: () {
                  //     print('IconButton pressed ...');
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
