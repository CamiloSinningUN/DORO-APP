import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
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
  final box = GetStorage();
  IO.Socket socket;
  // create a list of nameChats
  List<List<String>> nameChats = <List<String>>[];
  _chat_listState(this.socket) {
    readChats();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();

  void initState() {
    super.initState();
    socket.on('message', (data) {
      print('message: $data');
      updateChats(data);
    });
  }

  saveChats() async {
    //save chats
    String namesString = '';
    String idsString = '';
    print(nameChats);
    for (int i = 0; i < nameChats.length; i++) {
      namesString += nameChats[i][0] + ',';
      idsString += nameChats[i][1] + ',';
    }
    box.remove('nameChats');
    box.remove('idChats');
    box.write('nameChats', namesString);
    box.write('idChats', idsString);
  }

  readChats() async {
    var value = box.read('nameChats');
    print(value);
    if (value != null) {
      List<String> temp_names = value.split(',');
      temp_names.removeLast();
      nameChats.clear();
      value = box.read('idChats');
      List<String> temp_ids = value.split(',');
      temp_ids.removeLast();
      for (var i = 0; i < temp_names.length; i++) {
        nameChats.add([temp_names[i], temp_ids[i]]);
      }
    }
  }

  createIDDialog(BuildContext buildContext) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Tu id es: ${box.read('id')}',
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

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
                  onChanged: (value) {},
                ),
              ),
              TextButton(
                child: Text('Agregar'),
                onPressed: () {
                  // add user to the list
                  Navigator.of(context).pop();
                  setState(() {
                    nameChats
                        .insert(0, [nameController.text, idController.text]);
                    idController.clear();
                    nameController.clear();
                    saveChats();
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          createIDDialog(context);
                        },
                        child: Text(
                          'Chats',
                          style: TextStyle(
                            fontFamily: 'Orelega One',
                            color: Color(0xB5FFFFFF),
                            fontSize: 40,
                            fontWeight: FontWeight.normal,
                          ),
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
              Expanded(
                // constraints: BoxConstraints(
                //   maxHeight: double.infinity,
                // ),
                // decoration: BoxDecoration(),
                child: ListView.builder(
                  // physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  // shrinkWrap: true,
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
                                  child: Image.asset('assets/images/user.png'),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }

  void updateChats(data) {
    // data = [message: Strng, senderId: int]
    int idx =
        nameChats.indexWhere((element) => element[1] == data[1].toString());
    print('nameChats:');
    print(nameChats);
    print('idx: $idx');
    if (idx == -1) {
      print('new chat created');
      setState(() {
        nameChats.insert(0, [data[1].toString(), data[1].toString()]);
      });
    } else {
      //set the nameChat from idx to top
      print('chat already exist');
      setState(() {
        List chat = nameChats.removeAt(idx);
        nameChats.insert(0, chat);
      });
    }
    saveChats();
  }
}
