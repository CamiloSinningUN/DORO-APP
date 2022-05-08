import 'package:flutter/material.dart';
import 'MyHomePage.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      const MyHomePage(),
      Positioned.fill(
        child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.only(top: 50.0),
              color: HexColor('454545'),
              child: Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width * 0.9,
                height: 221.0,
              ),
            )),
      )
    ]));
  }
}
