import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MyMatch extends StatefulWidget {
  @override
  _MyMatchState createState() => _MyMatchState();
}

class _MyMatchState extends State<MyMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFFFF0),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                child: Text(
                  "My Match",
                  style: new TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontFamily: "Avenir"),
                )),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new _listMatch(
                          namaSatu: "Meteor FC",
                          gambarSatu:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgXEC4DKphv--nNGE-Frc5sm45x3wqCosp6-hwFKBDYa7dOLSJAA&s",
                          waktu: "1 - 0",
                          gambardua:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PnXLzsPOs9wR5jlnRwEMB_R2ilzoC7oiJA3fgpLAIANtaYsD3g&s",
                          namaDua: "Prima FC",
                        ),
                        CustomPaint(
                          painter: Drawhorizontalline(),
                        ),new _listMatch(
                          namaSatu: "Meteor FC",
                          gambarSatu:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgXEC4DKphv--nNGE-Frc5sm45x3wqCosp6-hwFKBDYa7dOLSJAA&s",
                          waktu: "1 - 0",
                          gambardua:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PnXLzsPOs9wR5jlnRwEMB_R2ilzoC7oiJA3fgpLAIANtaYsD3g&s",
                          namaDua: "Prima FC",
                        ),
                        CustomPaint(
                          painter: Drawhorizontalline(),
                        ),new _listMatch(
                          namaSatu: "Meteor FC",
                          gambarSatu:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgXEC4DKphv--nNGE-Frc5sm45x3wqCosp6-hwFKBDYa7dOLSJAA&s",
                          waktu: "1 - 0",
                          gambardua:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PnXLzsPOs9wR5jlnRwEMB_R2ilzoC7oiJA3fgpLAIANtaYsD3g&s",
                          namaDua: "Prima FC",
                        ),
                        CustomPaint(
                          painter: Drawhorizontalline(),
                        ),new _listMatch(
                          namaSatu: "Meteor FC",
                          gambarSatu:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgXEC4DKphv--nNGE-Frc5sm45x3wqCosp6-hwFKBDYa7dOLSJAA&s",
                          waktu: "1 - 0",
                          gambardua:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PnXLzsPOs9wR5jlnRwEMB_R2ilzoC7oiJA3fgpLAIANtaYsD3g&s",
                          namaDua: "Prima FC",
                        ),
                        CustomPaint(
                          painter: Drawhorizontalline(),
                        ),new _listMatch(
                          namaSatu: "Meteor FC",
                          gambarSatu:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgXEC4DKphv--nNGE-Frc5sm45x3wqCosp6-hwFKBDYa7dOLSJAA&s",
                          waktu: "1 - 0",
                          gambardua:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PnXLzsPOs9wR5jlnRwEMB_R2ilzoC7oiJA3fgpLAIANtaYsD3g&s",
                          namaDua: "Prima FC",
                        ),
                        CustomPaint(
                          painter: Drawhorizontalline(),
                        ),new _listMatch(
                          namaSatu: "Meteor FC",
                          gambarSatu:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgXEC4DKphv--nNGE-Frc5sm45x3wqCosp6-hwFKBDYa7dOLSJAA&s",
                          waktu: "1 - 0",
                          gambardua:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PnXLzsPOs9wR5jlnRwEMB_R2ilzoC7oiJA3fgpLAIANtaYsD3g&s",
                          namaDua: "Prima FC",
                        ),
                        CustomPaint(
                          painter: Drawhorizontalline(),
                        ),new _listMatch(
                          namaSatu: "Meteor FC",
                          gambarSatu:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgXEC4DKphv--nNGE-Frc5sm45x3wqCosp6-hwFKBDYa7dOLSJAA&s",
                          waktu: "1 - 0",
                          gambardua:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PnXLzsPOs9wR5jlnRwEMB_R2ilzoC7oiJA3fgpLAIANtaYsD3g&s",
                          namaDua: "Prima FC",
                        ),
                        CustomPaint(
                          painter: Drawhorizontalline(),
                        ),new _listMatch(
                          namaSatu: "Meteor FC",
                          gambarSatu:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgXEC4DKphv--nNGE-Frc5sm45x3wqCosp6-hwFKBDYa7dOLSJAA&s",
                          waktu: "1 - 0",
                          gambardua:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PnXLzsPOs9wR5jlnRwEMB_R2ilzoC7oiJA3fgpLAIANtaYsD3g&s",
                          namaDua: "Prima FC",
                        ),
                        CustomPaint(
                          painter: Drawhorizontalline(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class _listMatch extends StatelessWidget {
  _listMatch(
      {this.namaSatu,
      this.gambarSatu,
      this.waktu,
      this.gambardua,
      this.namaDua});
  String namaSatu;
  String gambarSatu;
  String waktu;
  String gambardua;
  String namaDua;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            namaSatu,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0,
                fontFamily: "Avenir"),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 30.0,
                height: 30.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill, image: new NetworkImage(gambarSatu))),
              )),
          Text(
            waktu,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,
                fontFamily: "Avenir"),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 30.0,
                height: 30.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill, image: new NetworkImage(gambardua))),
              )),
          Text(
            namaDua,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0,
                fontFamily: "Avenir"),
          ),
        ],
      ),
    );
  }
}

class Drawhorizontalline extends CustomPainter {
  Paint _paint;

  Drawhorizontalline() {
    _paint = Paint()
      ..color = Colors.black12
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(-175.0, 0.0), Offset(175.0, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
