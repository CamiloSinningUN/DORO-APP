import 'package:doro/functions/functions.dart';

import '../home_page/home_page_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import '../chat/message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key key}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  TextEditingController textController;
  List<String> myMsgs = <String>['Hola, Como estas?', 'Bien, y tu?'];
  bool inter = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  IO.Socket socket;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    socket = IO.io(
        'https://doro-back.herokuapp.com',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .build());
    socket.connect();
    setupSocketListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF296190),
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: 65,
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
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 0),
              width: 50,
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/user.png',
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
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
                  Text('Descansando',
                      style: TextStyle(
                        fontFamily: 'Orelega One',
                        color: Color(0xD8FFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: HomePageWidget.colorBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                scrollDirection: Axis.vertical,
                itemCount: myMsgs.length,
                itemBuilder: (BuildContext context, int index) {
                  final msg = myMsgs[index];
                  inter = !inter;
                  return message(inter, msg);
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 10, 10, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: TextFormField(
                        textInputAction: TextInputAction.newline,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
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
                          hintStyle: TextStyle(
                            fontFamily: 'Orelega One',
                            color: Color(0xCAFFFFFF),
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
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
                              EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        ),
                        style: TextStyle(
                          fontFamily: 'Orelega One',
                          color: Color(0xCAFFFFFF),
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xCC454545),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.send,
                        size: 32,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        if (textController.text.isNotEmpty) {
                          //send message
                          setState(() {
                            myMsgs.add(textController.text);
                            print(textController.text);
                            textController.text = '';
                            sendMessage(textController.text);
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //send message
  void sendMessage(String message) {
    socket.emit('message', [message]);
  }

  //receive message
  void receiveMessage(String message) {
    if (rYouStudying(HomePageWidget.State)) return;
    inter = false;
    setState(() {
      myMsgs.add(message);
      inter = true;
    });
  }

  //settingup socket listener
  void setupSocketListener() {
    socket.on('message', (data) {
      receiveMessage(data[0]);
    });
  }
}
