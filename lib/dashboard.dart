import 'dart:convert';
import 'dart:io';

import 'package:lapang_bola_flutter/models/club_response.dart';
import 'package:lapang_bola_flutter/models/myMatch_response.dart' as myMatch;

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart';
import 'package:lapang_bola_flutter/models/live_response.dart';
import 'package:lapang_bola_flutter/models/playerDetail_reponse.dart';
import 'package:lapang_bola_flutter/pilih_foto.dart';
import 'pertandingan.dart';
import 'package:lapang_bola_flutter/global/global.dart' as globals;
import 'package:intl/intl.dart';
import 'package:indonesia/indonesia.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String url = "https://liga.lapangbola.com/api/lives";

  CarouselSlider carouselSlider;
  int _currentIndex = 0;
  List listGambar = globals.listGambar;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget getDate(String matchDate) {
    var date = new DateTime.now();
    var day = DateFormat('EEEE').format(date);
    var fomatter = DateFormat('yMMMMEEEEd').format(date);
    var indoDate = tanggal(date);
    String realDate = fomatter.toString();
    var berlinWallFell = new DateTime.utc(1989, 11, 9);
    var moonLanding = DateTime.parse("1969-07-20 20:18:04Z"); // 8:18pm

    return Text(matchDate, style: new TextStyle(fontFamily: "Avenir"));
  }

  @override
  Widget build(BuildContext context) {
    getPlayeDetailRequest();

    Future<bool> _onWillPop() {
      return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to exit an App'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                FlatButton(
                  onPressed: () => exit(0),
                  /*Navigator.of(context).pop(true)*/
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Color(0xffEFFFF0),
        body: Container(
          padding: const EdgeInsets.only(top: 45.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 140.0,
                      height: 25.0,
                      padding: const EdgeInsets.only(top: 8.0),
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage("assets/Logo.png"))),
                    )),
//              Text(
//                "Lapangbola",
//                style: new TextStyle(
//                    fontSize: 24.0,
//                    color: Colors.green,
//                    fontWeight: FontWeight.bold,
//                    fontFamily: "Avenir_bold"),
//              ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                ),
                Text(
                  "Good Afternoon, " + globals.name + "!",
                  style: new TextStyle(
                      fontSize: 16.0,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                ),
                carouselSlider = CarouselSlider(
                  enlargeCenterPage: true,
                  autoPlay: false,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 1300),
                  pauseAutoPlayOnTouch: Duration(seconds: 2),
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  height: 160.0,
                  initialPage: 0,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: listGambar.map((imgUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 12.0),
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(15.0),
                              child: Image.network(
                                imgUrl,
                                fit: BoxFit.fill,
                              ),
                            ));
                      },
                    );
                  }).toList(),
                ),
//              SizedBox(
//                height: 10.0,
//                width: 10.0,
//              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: Image.asset("assets/tombol_slider_kiri.png"),
                        iconSize: 40.0,
                        onPressed: goToPreviousImage),
                    IconButton(
                      icon: Image.asset("assets/tombol_slider_kanan.png"),
                      onPressed: goToNextImage,
                      iconSize: 40.0,
                    ),
//                  OutlineButton(
//                      onPressed: goToPreviousImage,
//                      child: Text(
//                        "<",
//                        style: new TextStyle(fontSize: 16.0),
//                      )),
//                  OutlineButton(
//                    onPressed: goToNextImage,
//                    child: Text(
//                      ">",
//                      style: new TextStyle(fontSize: 16.0),
//                    ),
//                  ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                ),
                FutureBuilder(
                  future: _makePostRequest(url),
                  builder: (context, snapshot) {
                    String homeName = "-",
                        awayName = "-",
                        homeScore = "-",
                        awayScore = "-",
                        matchTime = "-",
                        matchName = "-",
                        homeImage = "-",
                        awayImage = "-";

                    if (!snapshot.hasData || snapshot.data == null) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      LiveResponse liveResponse = snapshot.data;
                      List<Datum> leagueData = liveResponse.data;
                      if (leagueData.isEmpty) {
                        print("No Live Matches");
                        return Center(
                            child: Text(
                          "No Live Matches",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              fontFamily: "Avenir"),
                          textAlign: TextAlign.center,
                        ));
                      } else {
                        return ListView.builder(
                          itemCount: leagueData.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            List<MatchDate> matchDateList = leagueData[index].matchDates;
                            return Column(
                              children: <Widget>[
                                Text(
                                  leagueData[index].name,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      fontFamily: "Avenir"),
                                ),
                                ListView.builder(
                                  itemCount: matchDateList.length,
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemBuilder: (context, index){
                                    List<MatchesCollection> matchesCollection = matchDateList[index].matchesCollection;
                                  return Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          ImageIcon(
                                            AssetImage("assets/Kalender.png"),
                                            color: Colors.amber,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8.0, 12.0, 0, 12.0),
                                            child: getDate(matchDateList[index].matchDate),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 340.0,
                                        child: SingleChildScrollView(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              physics: NeverScrollableScrollPhysics(),
                                              padding: EdgeInsets.only(
                                                  left: 20.0,
                                                  right: 20.0,
                                                  bottom: 12.0),
                                              itemCount: matchesCollection.length,
                                              itemBuilder: (context, index) {

                                                MatchesCollection data = matchesCollection[index];
                                                  matchTime = data.minute.toString();
                                                  matchName = data.stadium;


                                                  myMatch.Datum passData = new myMatch.Datum();
                                                  passData.stadium = data.stadium;
                                                  passData.id = data.id;
                                                  passData.homeName = data.homeName;
                                                  passData.homeImage = data.homeImage;
                                                  passData.homeScore = data.homeScore;
                                                  passData.awayScore = data.awayScore;
                                                  passData.awayName = data.awayName;
                                                  passData.awayImage = data.awayImage;
                                                  passData.shareableStatus = 0;

                                                return GestureDetector(
                                                  onTap: () => Navigator.of(context)
                                                      .push(new MaterialPageRoute(
                                                      builder: (BuildContext
                                                      context) =>
                                                      new Pertandingan(matchID: passData,))),
                                                  child: Container(
                                                    width: 300.0,
                                                    margin:
                                                    EdgeInsets.only(bottom: 16.0),
                                                    color: Color(0xffffffff),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      children: <Widget>[
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: <Widget>[
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  left: 12.0),
                                                              width: 30.0,
                                                              child: ImageIcon(
                                                                AssetImage(
                                                                    "assets/Lokasi.png"),
                                                                color: Colors.green,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                EdgeInsets.only(
                                                                    left: 12.0),
                                                                child: Text(matchName,
                                                                    textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                    style: new TextStyle(
                                                                        fontSize:
                                                                        12.0,
                                                                        fontFamily:
                                                                        "Avenir")),
                                                              ),
                                                            ),
                                                            new Container(
                                                              margin: const EdgeInsets
                                                                  .all(8.0),
                                                              padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  16.0,
                                                                  4.0,
                                                                  16.0,
                                                                  4.0),
                                                              decoration:
                                                              BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .lightBlueAccent),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    20.0),
                                                                color: Colors
                                                                    .lightBlueAccent,
                                                              ),
                                                              child: Text(
                                                                matchTime,
                                                                style: new TextStyle(
                                                                    fontSize: 12.0,
                                                                    fontFamily:
                                                                    "Avenir"),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Card(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: <Widget>[
                                                              new _listPertandingan(
                                                                gambar: data.homeImage,
                                                                nama: data.homeName,
                                                                skor: data.homeScore.toString(),
                                                              ),
                                                              new _listPertandingan(
                                                                gambar: data.awayImage,
                                                                nama: data.awayName,
                                                                skor: data.awayScore.toString(),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                      CustomPaint(painter: Drawhorizontalline(),),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                      ),
                                    ],
                                  );
                                })
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<LiveResponse> _makePostRequest(String url) async {
    // set up POST request arguments
    Map<String, String> headers = {"Content-type": "application/json"};
    // String json = '{"username": "ddesantha", "password": "opwbo123"}';
    // make POST request

    Response response = await get(url);
    print("Masuk kesiniaaaa");
    //print(response.body);
    //print(response.statusCode);
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
    LiveResponse liveResponse = liveResponseFromJson(body);
    print("Ini status dari response : " + liveResponse.status);

    return liveResponse;
  }

  Future getPlayeDetailRequest() async {
    print("testasdqwas");
    String apiUrl =
        "https://liga.lapangbola.com/api/players/detail?phone_number=" +
            globals.phone_number;

    Map<String, String> headers = {"Content-type": "application/json"};
    Map<String, String> mapString = {"phone_number": globals.phone_number};
    String json = jsonEncode(mapString);

    Response response = await get(apiUrl, headers: headers);

    PlayerDetailResponse playerDetailResponse =
        playerDetailResponseFromJson(response.body);

    String clubUrl = "https://liga.lapangbola.com/api/clubs/" +
        playerDetailResponse.clubId.toString();

    Response httpClubResponse = await get(clubUrl, headers: headers);
    globals.playerDetailReponse = playerDetailResponse;
    print("Player Detail Message " + globals.playerDetailReponse.message);

    ClubResponse clubResponse = clubResponseFromJson(httpClubResponse.body);

    globals.clubResponse = clubResponse;

    print("Player Detail Request Donee");

    print("Club Message " + globals.clubResponse.message);

    return playerDetailResponse;
  }

  goToPreviousImage() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNextImage() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}

class _listPertandingan extends StatelessWidget {
  _listPertandingan({this.gambar, this.nama, this.skor});
  String gambar;
  String nama;
  String skor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill, image: new NetworkImage(gambar))),
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(nama,
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir",
                    )),
              ),
            ),
            Text(skor,
                style: new TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Avenir"))
          ],
        ));
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
    canvas.drawLine(Offset(-160.0, 0.0), Offset(160.0, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}