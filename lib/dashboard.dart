import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart';
import 'package:lapang_bola_flutter/models/live_response.dart';
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
  List listGambar = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxUqcqam5VSexXhOeehxvJO3gpb65R0Lue1g2L6jwd5fcv4JCJTw&s',
    'https://www.fcbarcelona.com/photo-resources/2019/10/20/0a7ae5e7-887a-491c-a170-121740154469/mini_2019-10-19_FCBfutsalvsPALMA_06.jpg?width=1200&height=750',
    'https://d10dnch8g6iuzs.cloudfront.net/pictures/480x306/picture/39520190622102933698',
    'http://sportsgroundproduction.blob.core.windows.net/cms/14884/newsarticles/71167_wo.jpg'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget getDate(){
    var date = new DateTime.now();
    var day =  DateFormat('EEEE').format(date);
    var fomatter = DateFormat('yMMMMEEEEd').format(date);
    var indoDate = tanggal(date);
    String realDate = fomatter.toString();
    var berlinWallFell = new DateTime.utc(1989, 11, 9);
    var moonLanding = DateTime.parse("1969-07-20 20:18:04Z");  // 8:18pm

    return Text(
        realDate,
        style: new TextStyle(fontFamily: "Avenir"));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
              Text(
                "Hasil Pertandingan Pekan ke-2",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    fontFamily: "Avenir"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ImageIcon(
                    AssetImage("assets/Kalender.png"),
                    color: Colors.amber,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 12.0, 0, 12.0),
                    child: getDate(),
                  ),
                ],
              ),
              FutureBuilder(
                future: _makePostRequest(url),
                builder: (context, snapshot){
                  Datum tempData = snapshot.data.data[3];
                  String homeName = "-", awayName = "-", homeScore = "-" , awayScore = "-" ,
                      matchTime = "-" , matchName = "-", homeImage = "-", awayImage = "-";
                  if(tempData.matchesCollection == null){
                    print("matches null");
                  }else{
                    matchName = tempData.matchesCollection[0].stadium;
                    homeName = tempData.matchesCollection[0].homeName;
                    awayName = tempData.matchesCollection[0].awayName;
                    homeScore = tempData.matchesCollection[0].homeScore.toString();
                    awayScore = tempData.matchesCollection[0].awayScore.toString();
                    matchName = tempData.matchesCollection[0].stadium;
                    matchTime = tempData.matchesCollection[0].minute;
                    homeImage = tempData.matchesCollection[0].homeImage;
                    awayImage = tempData.matchesCollection[0].awayImage;
                  }
                  return Container(
                    width: 250.0,
                    color: Color(0xffffffff),
                    child: GestureDetector(
                      onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Pertandingan())),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              ),
                              ImageIcon(
                                AssetImage("assets/Lokasi.png"),
                                color: Colors.green,
                              ),
                              Container(
                                width: 120.0,
                                margin: EdgeInsets.only(left: 8.0),
                                child: Text(matchName,
                                    style: new TextStyle(
                                        fontSize: 12.0, fontFamily: "Avenir")),
                              ),
                              new Container(
                                margin: const EdgeInsets.all(8.0),
                                padding:
                                const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.lightBlueAccent),
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.lightBlueAccent,
                                ),
                                child: Text(
                                  matchTime,
                                  style: new TextStyle(
                                      fontSize: 12.0, fontFamily: "Avenir"),
                                ),
                              )
                            ],
                          ),
                          Card(
                            child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new _listPertandingan(
                                  gambar:
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgXEC4DKphv--nNGE-Frc5sm45x3wqCosp6-hwFKBDYa7dOLSJAA&s",
                                  nama: homeName,
                                  skor: homeScore,
                                ),
                                new _listPertandingan(
                                  gambar:
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PnXLzsPOs9wR5jlnRwEMB_R2ilzoC7oiJA3fgpLAIANtaYsD3g&s",
                                  nama: awayName,
                                  skor: awayScore,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              FutureBuilder(
                future: _makePostRequest(url),
                builder: (context, snapshot){
                  Datum tempData = snapshot.data.data[4];
                  String homeName = "-", awayName = "-", homeScore = "-" , awayScore = "-" ,
                      matchTime = "-" , matchName = "-", homeImage = "-", awayImage = "-";
                  if(tempData.matchesCollection == null){
                    print("matches null");
                  }else{
                    matchName = tempData.matchesCollection[0].stadium;
                    homeName = tempData.matchesCollection[0].homeName;
                    awayName = tempData.matchesCollection[0].awayName;
                    homeScore = tempData.matchesCollection[0].homeScore.toString();
                    awayScore = tempData.matchesCollection[0].awayScore.toString();
                    matchName = tempData.matchesCollection[0].stadium;
                    matchTime = tempData.matchesCollection[0].minute;
                    homeImage = "http://liga.lapangbola.com" + tempData.matchesCollection[0].homeImage;
                    awayImage = "http://liga.lapangbola.com" + tempData.matchesCollection[0].awayImage;
                  }
                  return Container(
                    width: 250.0,
                    color: Color(0xffffffff),
                    child: GestureDetector(
                      onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Pertandingan())),
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              ),
                              ImageIcon(
                                AssetImage("assets/Lokasi.png"),
                                color: Colors.green,
                              ),
                              Container(
                                width: 120.0,
                                margin: EdgeInsets.only(left: 8.0),
                                child: Text(matchName,
                                    style: new TextStyle(
                                        fontSize: 12.0, fontFamily: "Avenir")),
                              ),
                              new Container(
                                margin: const EdgeInsets.only(top:8.0, right: 8.0, bottom: 8.0),
                                padding:
                                const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.lightBlueAccent),
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.lightBlueAccent,
                                ),
                                child: Text(
                                  matchTime,
                                  style: new TextStyle(
                                      fontSize: 12.0, fontFamily: "Avenir"),
                                ),
                              )
                            ],
                          ),
                          Card(
                            child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new _listPertandingan(
                                  gambar:homeImage,
                                  nama: homeName,
                                  skor: homeScore,
                                ),
                                new _listPertandingan(
                                  gambar:awayImage,
                                  nama: awayName,
                                  skor: awayScore,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
              )
            ],
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
    LiveResponse loginResponse = liveResponseFromJson(body);
    print("Ini status dari response : " + loginResponse.status);

    return loginResponse;
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
            Container(
              width: 120.0,
              child: Text(nama,
                  style: new TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir")),
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
