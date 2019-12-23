import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'dart:io';
import 'package:lapang_bola_flutter/global/global.dart' as globals;
import 'package:image_picker/image_picker.dart';

class Edit_Statistik extends StatefulWidget {
  @override
  _Edit_StatistikState createState() => _Edit_StatistikState();
}

class _Edit_StatistikState extends State<Edit_Statistik> {
  Color warna = Colors.white;
  bool teksChange = false;
  bool enable = false;
  int currentIndex = 0;
  String teksJenis1 = "1 GOAL";
  String teksJenis2 = "2 ASSIST";
  String teksJenis3 = "4 CROSSING";
  String teksJenis4 = "2 SHOOTS ON GOAL";
  List<String> jenisStatistik = [
    "Attack  1",
    "Attack  2",
    "Defense 1",
    "Defense 2",
    "Goal Keeper",
  ];

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 200.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Share image via",
                  style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 16.0, top: 24.0, bottom: 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                          image:
                                              new AssetImage("assets/WA.png"))),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "WhatsApp",
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 16.0, top: 24.0, bottom: 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                          image: new AssetImage(
                                              "assets/Share_me.png"))),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "ShareMe",
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 16.0, top: 24.0, bottom: 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                          image: new AssetImage(
                                              "assets/Profile_pict.png"))),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Profile Pict",
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget pilJenis(String teks, bool selected, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Container(
          width: 55.0,
          height: 55.0,
          decoration: BoxDecoration(
              color: selected ? Colors.green : Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: selected ? Colors.black.withOpacity(.5) : Colors.black,
                )
              ]),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                teks,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: (selected ? Colors.white : Colors.black),
                    fontFamily: "Avenir",
                    fontSize: 10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Pilih Foto",
                  style: new TextStyle(
                      fontSize: 24.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir"),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                ),
                Container(
                  width: 300.0,
                  height: 350.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: new FileImage(globals.tempPicture),
                          fit: BoxFit.fill)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 300.0,
                        height: 200.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Image.asset(
                              "assets/Lapangbola_share.png",
                              width: 150.0,
                              color: (enable ? warna : warna),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, right: 16.0),
                                  child: Text(
                                    "FC Real Madrid 2",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        color: (enable ? warna : warna),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Avenir"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Text(
                                    "FC Real Madrid 2",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        color: (enable ? warna : warna),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Avenir"),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 175.0,
                        margin: EdgeInsets.only(top: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                "ALI",
                                style: new TextStyle(
                                    fontSize: 14.0,
                                    color: (enable ? warna : warna),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Avenir"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                "Right Wing Back",
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: (enable ? warna : warna),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Avenir"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                "FC Bimasakti",
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: (enable ? warna : warna),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Avenir"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0, top: 8.0),
                              child: Text(
                                teksJenis1,
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: (enable ? warna : warna),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Avenir"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                teksJenis2,
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: (enable ? warna : warna),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Avenir"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                teksJenis3,
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: (enable ? warna : warna),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Avenir"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                teksJenis4,
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: (enable ? warna : warna),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Avenir"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: Text(
                    "Change Color",
                    style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Avenir"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Wrap(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              enable = !enable;
                              warna = Colors.white;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.green)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              enable = !enable;
                              warna = Colors.black;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            margin: EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.green)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              enable = !enable;
                              warna = Colors.blue;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            margin: EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.green)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              enable = !enable;
                              warna = Colors.green;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            margin: EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.green)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              enable = !enable;
                              warna = Colors.yellow;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            margin: EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.green)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              enable = !enable;
                              warna = Colors.orange;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            margin: EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.green)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              enable = !enable;
                              warna = Colors.red;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            margin: EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.green)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Pilih Statistik",
                    style: new TextStyle(color: Colors.black, fontSize: 14.0),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: jenisStatistik.map((item) {
                    var index = jenisStatistik.indexOf(item);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          if (index == 0) {
                            teksJenis1 = "1 GOAL";
                            teksJenis2 = "2 ASSIST";
                            teksJenis3 = "4 CROSSING";
                            teksJenis4 = "2 SHOOTS ON GOAL";
                          } else if (index == 1) {
                            teksJenis1 = "1 GOAL";
                            teksJenis2 = "2 ASSIST";
                            teksJenis3 = "4 DRIBLE SUCCES";
                            teksJenis4 = "2 SHOOTS ON TARGER";
                          } else if (index == 2) {
                            teksJenis1 = "1 TACLE";
                            teksJenis2 = "2 SLIDING";
                            teksJenis3 = "4 BODY";
                            teksJenis4 = "2 SAVE";
                          } else if (index == 3) {
                            teksJenis1 = "1 TACLE";
                            teksJenis2 = "2 SLIDING";
                            teksJenis3 = "4 GATAU";
                            teksJenis4 = "2 JAGA ORANG";
                          } else if (index == 4) {
                            teksJenis1 = "1 SAVE";
                            teksJenis2 = "2 BLOCK CROSS";
                            teksJenis3 = "4 ASSIST";
                            teksJenis4 = "2 GOAL";
                          }
                        });
                      },
                      child: pilJenis(item, index == currentIndex, context),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                ),
                SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      _settingModalBottomSheet(context);
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.green),
                    ),
                    child: Text(
                      "SHARE",
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
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
