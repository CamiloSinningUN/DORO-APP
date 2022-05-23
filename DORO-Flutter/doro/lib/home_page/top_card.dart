import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../home_page/home_page_widget.dart';

class top_card extends StatelessWidget {
  const top_card({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, -1),
      child: Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
        width: double.infinity,
        height: 225,
        decoration: BoxDecoration(
          color: HomePageWidget.colorOver,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: AlignmentDirectional(0, 0),
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      HomePageWidget.gifPath,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    // The text border
                    Text(
                      HomePageWidget.State,
                      style: TextStyle(
                        fontFamily: 'Orelega one',
                        fontSize: 40,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1.5
                          ..color = Color(0xff292929),
                      ),
                    ),
                    // The text inside
                    Text(
                      HomePageWidget.State,
                      style: TextStyle(
                        fontFamily: 'Orelega one',
                        color: Color(0x98FFFFFF),
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(120, 0, 120, 0),
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
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              width: double.infinity,
              child: LinearPercentIndicator(
                percent: 0,
                // width: 500,
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
      ),
    );
  }
}
