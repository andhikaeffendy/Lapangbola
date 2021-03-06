import 'package:flutter/material.dart';
import 'package:lapang_bola_flutter/models/club_response.dart';
import 'statistik.dart';
import 'package:lapang_bola_flutter/global/global.dart' as globals;

class Desc_Team extends StatefulWidget {
  @override
  _Desc_TeamState createState() => _Desc_TeamState();
}

String checkEmpty(var string){
  String value = '-';
  if(string!=null){
    value = string.toString();
  }
  return value;
}

class _Desc_TeamState extends State<Desc_Team> {

  ClubResponse clubData = globals.clubResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFFFF0),
      body: Container(
        padding: const EdgeInsets.only(top: 40.0),
        child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Team",
                    style: new TextStyle(
                        fontSize: 24.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Avenir"),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                  Container(
                    width: 320.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 80.0,
                                  height: 85.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              "https://live.lapangbola.com/documents/clubs/galados-edit_original_412.png?1545968116"))),
                                )),
//                            Positioned(
//                              bottom: 0,
//                              right: 0,
//                              child: Align(
//                                  alignment: Alignment.bottomLeft,
//                                  child: GestureDetector(
//                                    onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
//                                        builder: (BuildContext context) => new Statistik())),
//                                    child: Container(
//                                      width: 30.0,
//                                      height: 30.0,
//                                      decoration: new BoxDecoration(
//                                          shape: BoxShape.circle,
//                                          image: new DecorationImage(
//                                              fit: BoxFit.fill,
//                                              image: new AssetImage(
//                                                  "assets/Register.png"))),
//                                    ),
//                                  )),
//                            )
                          ],
                          overflow: Overflow.clip,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                clubData.clubName,
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Avenir"),
                              ),
                            ),Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                checkEmpty(clubData.stadion),
                                style: new TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontFamily: "Avenir"),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 320.0,
                    margin: const EdgeInsets.only(top: 18.0),
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.green,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Play",
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),Text(
                              clubData.totalPlay.toString(),
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          ],
                        ),Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Wins",
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),Text(
                              clubData.totalWin.toString(),
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          ],
                        ),Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Draw",
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),Text(
                              clubData.totalDraw.toString(),
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          ],
                        ),Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Lose",
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),Text(
                              clubData.totalLose.toString(),
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),Container(
                    width: 320.0,
                    padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            "Nama Team",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                        ),GestureDetector(
                          onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new Statistik())),
                          child: Text(
                            clubData.clubName,
                            style: new TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontFamily: "Avenir"),
                          ),
                        ),Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Deskripsi",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                        ),Text(
                          checkEmpty(clubData.description),
                          style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: "Avenir"),
                        ),Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Stadion",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                        ),Text(
                          checkEmpty(clubData.stadion),
                          style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: "Avenir"),
                        ),Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Tahun Berdiri",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                        ),Text(
                          checkEmpty(clubData.tahunBerdiri),
                          style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: "Avenir"),
                        ),Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Penanggung Jawab",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                        ),Text(
                          checkEmpty(clubData.penanggungJawab),
                          style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: "Avenir"),
                        ),Padding(
                          padding: EdgeInsets.all(8.0),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                  ),SizedBox(
                    width: 100.0,
                    height: 100.0,
                  )
                ],
              ),
            )
        ),
      ),

    );
  }
}
