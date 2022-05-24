import 'package:doro/notas/notas_widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_debounce/easy_debounce.dart';

class note extends StatefulWidget {
  TextEditingController textController1;
  TextEditingController textController2;
  Function onChanged;
  note(this.textController1, this.textController2, this.onChanged, {Key key})
      : super(key: key);

  @override
  _noteState createState() =>
      _noteState(textController1, textController2, onChanged);
}

class _noteState extends State<note> {
  TextEditingController textController1;
  TextEditingController textController2;
  Function onChanged;
  _noteState(this.textController1, this.textController2, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0x38030303),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
              child: TextFormField(
                controller: textController1,
                onChanged: (_) => onChanged(),
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Aquí va el título...',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'Orelega One',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 5),
              child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: textController2,
                  maxLines: null,
                  enableInteractiveSelection: true,
                  onChanged: (_) => onChanged(),
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Aquí va la nota...',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Orelega One',
                    color: Color(0xCFFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
