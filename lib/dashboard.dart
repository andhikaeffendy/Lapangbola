import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                "Good Afternoon, Ade!",
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
                    child: Text(
                      "Minggu, 1 Okt 2019",
                      style: new TextStyle(fontFamily: "Avenir"),
                    ),
                  ),
                ],
              ),
              Container(
                width: 250.0,
                color: Color(0xffffffff),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        ),
                        ImageIcon(
                          AssetImage("assets/Lokasi.png"),
                          color: Colors.green,
                        ),
                        Text("Lapangan Padjajaran",
                            style: new TextStyle(
                                fontSize: 12.0, fontFamily: "Avenir")),
                        new Container(
                          margin: const EdgeInsets.all(8.0),
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 4.0, 18.0, 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.lightBlueAccent),
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.lightBlueAccent,
                          ),
                          child: Text(
                            "45'",
                            style: new TextStyle(
                                fontSize: 12.0, fontFamily: "Avenir"),
                          ),
                        )
                      ],
                    ),
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new _listPertandingan(
                            gambar:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgXEC4DKphv--nNGE-Frc5sm45x3wqCosp6-hwFKBDYa7dOLSJAA&s",
                            nama: "Meteor FC",
                            skor: "1",
                          ),
                          new _listPertandingan(
                            gambar:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PnXLzsPOs9wR5jlnRwEMB_R2ilzoC7oiJA3fgpLAIANtaYsD3g&s",
                            nama: "Prima FC",
                            skor: "0",
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Container(
                width: 250.0,
                color: Color(0xffffffff),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        ),
                        ImageIcon(
                          AssetImage("assets/Lokasi.png"),
                          color: Colors.green,
                        ),
                        Text("Lapangan Padjajaran",
                            style: new TextStyle(
                                fontSize: 12.0, fontFamily: "Avenir")),
                        new Container(
                          margin: const EdgeInsets.all(8.0),
                          padding:
                              const EdgeInsets.fromLTRB(6.0, 4.0, 6.0, 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellowAccent),
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.yellowAccent,
                          ),
                          child: Text(
                            "FULL TIME",
                            style: new TextStyle(
                                fontSize: 12.0, fontFamily: "Avenir"),
                          ),
                        )
                      ],
                    ),
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new _listPertandingan(
                            gambar:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgXEC4DKphv--nNGE-Frc5sm45x3wqCosp6-hwFKBDYa7dOLSJAA&s",
                            nama: "Meteor FC",
                            skor: "1",
                          ),
                          new _listPertandingan(
                            gambar:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PnXLzsPOs9wR5jlnRwEMB_R2ilzoC7oiJA3fgpLAIANtaYsD3g&s",
                            nama: "Prima FC",
                            skor: "0",
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
            Text(nama,
                style: new TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Avenir")),
            Text(skor,
                style: new TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Avenir"))
          ],
        ));
  }
}
