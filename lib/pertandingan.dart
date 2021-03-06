
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lapang_bola_flutter/models/match_detail_reponse.dart';
import 'package:lapang_bola_flutter/models/myMatch_response.dart';
import 'package:lapang_bola_flutter/models/player_match_detail_response.dart';
import 'package:lapang_bola_flutter/pilih_foto.dart';
import 'pilih_foto.dart';
import 'package:lapang_bola_flutter/global/global.dart' as globals;

class Pertandingan extends StatefulWidget {
  final Datum matchID;

  const Pertandingan({Key key, this.matchID}) : super(key: key);

  @override
  _PertandinganState createState() => _PertandinganState(matchID);
}

class _PertandinganState extends State<Pertandingan> {
  final Datum matchData;

  _PertandinganState(this.matchData);

  @override
  Widget build(BuildContext context) {
    print("match id = " + matchData.id.toString());
    return Scaffold(
      backgroundColor: Color(0xffEFFFF0),
      body: FutureBuilder(
        future: _makePostRequest(matchData.id),
        builder: (context, snapshot){
          MatchDetailResponse matchDetail = snapshot.data;
          if(!snapshot.hasData || snapshot.data == null){
            return Center(child: CircularProgressIndicator());
          }else{
            globals.tempHomeName = matchData.homeName + " " + matchData.homeScore.toString();
            globals.tempAwayName = matchData.awayName + " " + matchData.awayScore.toString();
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
                                      'https://www.staradmiral.com/wp-content/uploads/2017/01/Empat-Macam-Lapangan-Futsal.jpg'),
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
                                                  fit: BoxFit.fitHeight,
                                                  image: new NetworkImage(
                                                      matchData.homeImage))),
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
                                              matchData.stadium,
                                              style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white,
                                                  fontFamily: "Avenir"),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              matchDetail.matchDate,
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
                                                  fit: BoxFit.fitHeight,
                                                  image: new NetworkImage(
                                                      matchData.awayImage))),
                                        )),
                                  ],
                                ),
                              ),
                            )),
                        Container(
                          color: Colors.green,
                          padding: EdgeInsets.only(
                              top: 12.0, bottom: 12.0, left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 100.0,
                                child: Text(
                                  matchData.homeName,
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontFamily: "Avenir"),
                                ),
                              ),
                              Text(
                                matchData.homeScore.toString() + " - " + matchData.awayScore.toString(),
                                style: new TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Avenir"),
                              ),
                              Container(
                                width: 100.0,
                                child: Text(
                                  matchData.awayName,
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontFamily: "Avenir"),
                                ),
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
                                  Text(
                                    "Match Stats",
                                    style: new TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Avenir"),
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
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.goalHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Goals",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.goalAway.toString(),
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
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.shootonHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Shoots On Target",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.shootonAway.toString(),
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
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.shootoffHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Shoots Of Target",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.shootoffAway.toString(),
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
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.shootblockHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Shoots Blocked",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.shootblockAway.toString(),
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
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.possHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Possession (%)",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.possAway.toString(),
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
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.passHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Passes",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.passAway.toString(),
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
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.accuracyHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Pass Accuracy (%)",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.accuracyAway.toString(),
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
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.tackleHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Tackles",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.tackleAway.toString(),
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
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.penaltymissHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Penalty Missed",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.penaltymissAway.toString(),
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
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.owngoalHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Own Goals",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.owngoalAway.toString(),
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
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.foulHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Fouls",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.foulAway.toString(),
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
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.yellowHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Yellow Cards",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.yellowAway.toString(),
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
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.redHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Red Cards",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.redAway.toString(),
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
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.cornerHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Corners",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.cornerAway.toString(),
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
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.offsideHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Offsides",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.offsideAway.toString(),
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
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Container(
                                      width: 50.0,
                                      child: Text(
                                        matchDetail.crossHome.toString(),
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text(
                                        "Crosses",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      matchDetail.crossAway.toString(),
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
        },
      ),
    );
  }

  Future<MatchDetailResponse> _makePostRequest(int id) async {
    // set up POST request arguments
    String mainUrl = "https://live.lapangbola.com/api/lives/";
    String urlDetailPlayer = "https://live.lapangbola.com/api/player_matches/";
    String url = mainUrl + id.toString();
    String playerUrl = urlDetailPlayer + id.toString() + "?phone_number=" + globals.phone_number;
    Map<String, String> headers = {"Content-type": "application/json"};

    Response response = await get(url, headers: headers);

    if(matchData.shareableStatus!=0){
      Response responseDetail = await get(playerUrl, headers: headers);
      PlayerMatchDetailResponse playerMatchDetailResponse = playerMatchDetailResponseFromJson(responseDetail.body);
      globals.playerMatchDetailResponse = playerMatchDetailResponse;

    }

    print("Masuk kesini");
    print(response.body);
    print(response.statusCode);
    // check the status code for the result
    // this API passes back the id of the new item added to the body
    String body = response.body;




    MatchDetailResponse loginResponse = matchDetailResponseFromJson(body);

    print("Ini status dari response : " + loginResponse.status);

    return loginResponse;
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
