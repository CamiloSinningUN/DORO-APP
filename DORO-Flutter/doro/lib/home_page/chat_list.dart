import 'package:flutter/material.dart';
import '../home_page/home_page_widget.dart';
import '../functions/functions.dart';
import '../routes/routes.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class chat_list extends StatefulWidget {
  IO.Socket socket;
  chat_list(this.socket, {Key key}) : super(key: key);

  @override
  _chat_listState createState() => _chat_listState(this.socket);
}

class _chat_listState extends State<chat_list> {
  IO.Socket socket;
  // create a list of nameChats
  List<List<String>> nameChats = <List<String>>[];
  _chat_listState(this.socket);

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();

  createUserDialog(BuildContext buildContext) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Escriba el username y el id de la persona que desea agregar:',
              // style: TextStyle(
              //   fontFamily: 'Orelega One',
              //   color: Colors.black,
              //   fontSize: 20,
              //   fontWeight: FontWeight.normal,
              // ),
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Username',
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                child: TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Id',
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              TextButton(
                child: Text('Agregar'),
                onPressed: () {
                  // add user to the list
                  Navigator.of(context).pop();
                  setState(() {
                    nameChats.add([nameController.text, idController.text]);
                    // print(nameController.text);
                    // nameController.text = '';
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: HomePageWidget.colorOver,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Chats',
                          style: TextStyle(
                            fontFamily: 'Orelega One',
                            color: Color(0xB5FFFFFF),
                            fontSize: 40,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add_box,
                            size: 32,
                          ),
                          color: Color(0xB5FFFFFF),
                          onPressed: () {
                            createUserDialog(context);
                          },
                        ),
                      ],
                    )),
                Container(
                  width: double.infinity,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(71, 0, 0, 0),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: nameChats.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          if (!rYouStudying(HomePageWidget.State)) {
                            Navigator.of(context)
                                .push(createChat(socket, nameChats[index]));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Container(
                                    width: 55,
                                    height: 55,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child:
                                        Image.asset('assets/images/user.png'),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        child: Text(
                                          nameChats[index][0],
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: 'Orelega One',
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Text('Hola',
                                          style: TextStyle(
                                            fontFamily: 'Orelega One',
                                            color: Color(0xB6FFFFFF),
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 20.0),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Color(0xff296190),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
