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
                child: Stack(children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 221.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "assets/gifs/2.gif",
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black.withOpacity(0.3)),
                    margin: const EdgeInsets.only(top: 220.0, left: 19.0),
                    height: 10.0,
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.topCenter,
                  )
                ])

                // child: Container(
                //   margin: const EdgeInsets.only(top: 15.0),
                //   alignment: Alignment.topCenter,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   height: 221.0,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(8.0),
                //     child: Image.asset(
                //       "assets/gifs/2.gif",
                //       width: MediaQuery.of(context).size.width * 0.8,
                //     ),
                //   ),
                // ),
                )),
      )
    ]));
  }
}
