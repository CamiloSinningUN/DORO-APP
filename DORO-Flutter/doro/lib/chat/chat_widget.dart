import 'package:doro/functions/functions.dart';

import '../home_page/home_page_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import '../chat/message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatWidget extends StatefulWidget {
  final IO.Socket socket;
  final List<String> nameChat;
  const ChatWidget(this.socket, this.nameChat, {Key key}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState(socket, nameChat);
}

class _ChatWidgetState extends State<ChatWidget> {
  IO.Socket socket;
  List<String> nameChat;
  _ChatWidgetState(this.socket, this.nameChat);

  TextEditingController textController;
  List<String> myMsgs = <String>['Hola'];
  bool inter = true;
  ScrollController _scrollController = ScrollController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();

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
                      nameChat[0],
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
                controller: _scrollController,
                padding: EdgeInsets.only(top: 10),
                scrollDirection: Axis.vertical,
                itemCount: myMsgs.length,
                itemBuilder: (BuildContext context, int index) {
                  final msg = myMsgs[index];
                  // inter = !inter;
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
                          inter = true;
                          //send message
                          setState(() {
                            myMsgs.add(textController.text);
                            print(textController.text);
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 300),
                            );
                            sendMessage(textController.text);
                            textController.text = '';
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
    socket.emit('message', [message, int.parse(nameChat[1])]);
  }

  //receive message
  void receiveMessage(String message) {
    if (rYouStudying(HomePageWidget.State)) return;
    inter = false;
    setState(() {
      myMsgs.add(message);
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  //settingup socket listener
  void setupSocketListener() {
    socket.on('message', (data) {
      print('mensaje');
      print(data);
      dynamic message = data[0];
      dynamic sender = data[1];
      print(sender);
      if (sender == int.parse(nameChat[1])) {
        receiveMessage(message);
      }
    });
  }
}
