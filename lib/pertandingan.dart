import 'package:flutter/material.dart';
import 'package:lapang_bola_flutter/pilih_foto.dart';
import 'pilih_foto.dart';

class Pertandingan extends StatefulWidget {
  @override
  _PertandinganState createState() => _PertandinganState();
}

class _PertandinganState extends State<Pertandingan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFFFF0),
      body: Container(
        padding: const EdgeInsets.only(top: 40.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 250.0,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Pertandingan",
                        style: new TextStyle(
                            fontSize: 24.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Avenir"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40.0),
                      child: IconButton(
                        icon: Icon(Icons.directions),
                        color: Colors.yellow,
                        iconSize: 30.0,
                        alignment: Alignment.centerRight,
                        onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new Pilih_Foto())),
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0),
                    height: 180.0,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://www.staradmiral.com/wp-content/uploads/2017/01/Empat-Macam-Lapangan-Futsal.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 70.0,
                        padding: EdgeInsets.all(8.0),
                        color: Colors.black54,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              "http://pluspng.com/img-png/circle-png-white-circle-icon-512.png"))),
                                )),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "Lap. Batununggal, Bandung",
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontFamily: "Avenir"),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "24 Nov 2019",
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Avenir"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              "http://pluspng.com/img-png/circle-png-white-circle-icon-512.png"))),
                                )),
                          ],
                        ),
                      ),
                    )),
                Container(
                  color: Colors.green,
                  padding: EdgeInsets.only(
                      top: 12.0, bottom: 12.0, left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Meteor FC",
                        style: new TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontFamily: "Avenir"),
                      ),
                      Text(
                        "2 - 1",
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Avenir"),
                      ),
                      Text(
                        "Bhineka FC",
                        style: new TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontFamily: "Avenir"),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Full Time",
                          style: new TextStyle(
                              fontSize: 12.0,
                              color: Colors.black54,
                              fontFamily: "Avenir"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.equalizer,
                            color: Colors.amberAccent,
                            size: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Match Stats",
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
                        padding: const EdgeInsets.all(12.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "40,5",
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          ),
                          Text(
                            "Possesions %",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Text(
                              "59,5",
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
                        padding: const EdgeInsets.all(12.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "8",
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          ),
                          Text(
                            "Shoots On Target",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Text(
                              "5",
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
                        padding: const EdgeInsets.all(12.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "12",
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          ),
                          Text(
                            "Shoots",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Text(
                              "11",
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
                        padding: const EdgeInsets.all(12.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "584",
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          ),
                          Text(
                            "Touches",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Text(
                              "782",
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
                        padding: const EdgeInsets.all(12.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "379",
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          ),
                          Text(
                            "Passes",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Text(
                              "582",
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      )
                    ],
                  ),
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
