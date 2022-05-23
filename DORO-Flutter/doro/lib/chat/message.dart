import 'package:flutter/material.dart';

class message extends StatefulWidget {
  String msg;
  bool isMe;
  message(this.isMe, this.msg);

  @override
  _messageState createState() => _messageState(isMe, msg);
}

class _messageState extends State<message> {
  String msg;
  bool isMe;
  _messageState(this.isMe, this.msg);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
          child: Container(
            decoration: BoxDecoration(
              color: isMe ? Color(0xFFFFFFFF) : Color(0xFFC4C4C4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Text(
                msg,
                style: TextStyle(
                  fontFamily: 'Orelega One',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
