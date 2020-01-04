import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:lapang_bola_flutter/global/global.dart' as globals;

class Statistik extends StatefulWidget {
  @override
  _StatistikState createState() => _StatistikState();
}

class _StatistikState extends State<Statistik> {
  @override
  Widget build(BuildContext context) {
    var data = globals.clubResponse;

    return Scaffold(
      backgroundColor: Color(0xffEFFFF0),
      body: Container(
        padding: EdgeInsets.only(top: 40.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "Statistik",
                  style: new TextStyle(
                      fontSize: 24.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir"),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: EdgeInsets.only(top: 20.0),
                  height: 180.0,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://s3.eu-north-1.amazonaws.com/norkring/_articleLandscape/iStock-1149063259.jpg?mtime=20190925151000'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill, image: new NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_IPgOBGoWinrAadO70BreDe39RCvvN-bLxg2dIw6rPVO_sP8pdw&s"))),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          data.clubName,
                          style: new TextStyle(
                            fontSize: 24.0,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Avenir",
                            shadows: [
                              Shadow(
                                blurRadius: 20.0,
                                color: Colors.black,
                                offset: Offset(0, 0),
                              ),
                            ],),
                        ),
                      ),Text(
                        "Bandung",
                        style: new TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir",
                          shadows: [
                            Shadow(
                              blurRadius: 20.0,
                              color: Colors.black,
                              offset: Offset(0, 0),
                            ),
                          ],),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 400.0,
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill, image:
                                    new AssetImage("assets/Attack.png"))),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Attack",
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      ),Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              "Most Goal",
                              style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: "Avenir"),
                            ),
                          ),
                          Text(
                            data.totalGoal.toString(),
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                        ],
                      ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      ),Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              "Shoots",
                              style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: "Avenir"),
                            ),
                          ),
                          Text(
                            (data.totalShootOffTarget+data.totalShootOnTarget).toString(),
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                        ],
                      ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      ),Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              "Shoots On Target",
                              style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: "Avenir"),
                            ),
                          ),
                          Text(
                            data.totalShootOnTarget.toString(),
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                        ],
                      ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      ),Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 20.0,
                                height: 25.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill, image:
                                    new AssetImage("assets/Teamwork.png"))),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Team Play",
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      ),Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              "Most Passes",
                              style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: "Avenir"),
                            ),
                          ),
                          Text(
                            data.totalPassing.toString(),
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                        ],
                      ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      ),Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              "Crosses",
                              style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: "Avenir"),
                            ),
                          ),
                          Text(
                            data.totalBlockCross.toString(),
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                        ],
                      ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Drawhorizontalline extends CustomPainter {
  Paint _paint;

  Drawhorizontalline() {
    _paint = Paint()
      ..color = Colors.black12
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(-155.0, 0.0), Offset(155.0, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}