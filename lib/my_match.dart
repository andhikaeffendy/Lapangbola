import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart';
import 'package:lapang_bola_flutter/models/myMatch_response.dart';
import 'package:lapang_bola_flutter/pertandingan.dart';
import 'pertandingan.dart';
import 'package:lapang_bola_flutter/global/global.dart' as globals;


class MyMatch extends StatefulWidget {
  @override
  _MyMatchState createState() => _MyMatchState();
}

class _MyMatchState extends State<MyMatch> {
  String masterUrl = "https://liga.lapangbola.com/api/player_matches";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFFFF0),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              child:
              Container(
                margin: EdgeInsets.all(16.0),
                child: FutureBuilder(
                  future: _makePostRequest(masterUrl, globals.phone_number),
                  builder: (context, snapshot){
                    if (!snapshot.hasData || snapshot.data == null) {
                      return Center(child: CircularProgressIndicator());
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (context, index) {
                          Datum project = snapshot.data.data[index];
                          globals.myMatchResponse = snapshot.data;
                          return Column(
                            children: <Widget>[
                              Card(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        new _listMatch(
                                          namaSatu: project.homeName,
                                          gambarSatu: project.homeImage,
                                          scoreHome: project.homeScore,
                                          scoreAway: project.awayScore,
                                          gambardua: project.awayImage,
                                          namaDua: project.awayName,
                                        ),
                                        new CustomPaint(painter: Drawhorizontalline(),)]
                                  )
                              ),// Widget to display the list of project
                            ],
                          );
                        },
                      );
                    }

                  },
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<MyMatchResponse> _makePostRequest(String mainUrl, phoneNumber) async {
    // set up POST request arguments
    if(globals.myMatchResponse!=null){
      return globals.myMatchResponse;
    }
    String url = mainUrl +"?phone_number="+globals.phone_number;
    Map<String, String> headers = {"Content-type": "application/json"};
    // String json = '{"username": "ddesantha", "password": "opwbo123"}';
    Map<String, String> mapString = {"phone_number" : phoneNumber};
    String json = jsonEncode(mapString);
    print("Ini hasil jsonEncode : " + json);
    // make POST request

    Response response = await get(url, headers: headers);
    print("Masuk kesini");
    print(response.body);
    print(response.statusCode);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }
    MyMatchResponse loginResponse = myMatchResponseFromJson(body);
    print("Ini status dari response : " + loginResponse.status);

    return loginResponse;
  }
}

class _listMatch extends StatelessWidget {
  _listMatch(
      {this.namaSatu,
      this.gambarSatu,
      this.scoreHome,
        this.scoreAway,
      this.gambardua,
      this.namaDua});
  String namaSatu;
  String gambarSatu;
  int scoreHome;
  int scoreAway;
  String gambardua;
  String namaDua;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new Pertandingan())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8.0),
              width: 80,
              child: Text(
                namaSatu,
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0,
                    fontFamily: "Avenir"),
              ),
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
            Container(
              margin: EdgeInsets.only(left: 8.0),
              width: 15.0,
              child: Text(
                scoreHome.toString(),
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,
                    fontFamily: "Avenir"),
              ),
            ),Text(
              " - ",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,
                  fontFamily: "Avenir"),
            ),Container(
              margin: EdgeInsets.only(right: 8.0),
              width: 15.0,
              child: Text(
                scoreAway.toString(),
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,
                    fontFamily: "Avenir"),
              ),
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
            Container(
              margin: EdgeInsets.only(left: 12.0),
              width: 70,
              child: Text(
                namaDua,
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0,
                    fontFamily: "Avenir"),
              ),
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
                size: 15.0,
              ),
            ),


          ],
        ),

      ),

    );
  }

}

class Drawhorizontalline extends CustomPainter {
  Paint _paint;

  Drawhorizontalline() {
    _paint = Paint()
      ..color = Colors.black38
      ..strokeWidth = 2
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
