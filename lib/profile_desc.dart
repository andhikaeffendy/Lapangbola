import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lapang_bola_flutter/models/logout_response.dart';
import 'package:lapang_bola_flutter/profile.dart';
import 'package:lapang_bola_flutter/statistik.dart';
import 'login_form.dart';
import 'profile.dart';
import 'statistik.dart';
import 'package:lapang_bola_flutter/global/global.dart' as globals;
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog pr;


class Profile_Desc extends StatefulWidget {
  @override
  _Profile_DescState createState() => _Profile_DescState();
}

class _Profile_DescState extends State<Profile_Desc> {
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
                  "Profile",
                  style: new TextStyle(
                      fontSize: 24.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir"),
                ),Padding(
                  padding: const EdgeInsets.all(18.0),
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
                                        image: new AssetImage(
                                            "assets/User.png"))),
                              )),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: GestureDetector(
                                  onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                                      builder: (BuildContext context) => new Profile())),
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: new AssetImage(
                                                "assets/Register.png"))),
                                  ),
                                )),
                          )
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
                              globals.name,
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Avenir"),
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              globals.email,
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
                            "Games",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),Text(
                            "8",
                            style: new TextStyle(
                                fontSize: 24.0,
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
                            "6",
                            style: new TextStyle(
                                fontSize: 24.0,
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
                            "Saves",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),Text(
                            "14",
                            style: new TextStyle(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),Container(
                  width: 320.0,
                  height: 250.0,
                  padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          "Team",
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
                          "Bhineka FC",
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: "Avenir"),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          "City",
                          style: new TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Avenir"),
                        ),
                      ),Text(
                        "Bandung",
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontFamily: "Avenir"),
                      ),Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          "Position",
                          style: new TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Avenir"),
                        ),
                      ),Text(
                        "Goal Keeper",
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontFamily: "Avenir"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                ),SizedBox(
                  width: 320.0,
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: (){_showDialog(context);},
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.green),
                    ),
                    child: Text(
                      "LOG OUT",
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ),

    );
  }
}

void _showDialog(BuildContext context) {
  String url = "http://app.lapangbola.com/api/players/sign_out";

  pr = new ProgressDialog(context,type: ProgressDialogType.Normal);

  pr.style(message: 'Logout...');
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Logout"),
        content: new Text("Apakah anda yakin ingin keluar?"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Tidak"),
            onPressed: (){
              Navigator.of(context).pop();
            }
          ),
          new FlatButton(
            child: new Text("Ya"),
            onPressed: () {
                _makePostRequest(url, context).then((task){
                  if(task.status=="success"){
                    pr.hide();
                    globals.auth_token = "";
                    globals.email = "";
                    globals.phone_number = "";
                    globals.name = "";
                    globals.phone_number = "";
                    globals.is_Login = false;
                    globals.myMatchResponse = null;
                    globals.photoUrl = "";
                    globals.playerID = 0;
                    globals.gender = "";

                    showDialog(context: context, child:
                    new AlertDialog(
                      content: new Text("Has Been Logout"),
                    )
                    );

                    Navigator.of(context).push(FadeRoute(page: Login_form()));
                  }
                }
                );



            },
          ),
        ],
      );
    },
  );
}

Future<LogoutResponse> _makePostRequest(String url, context) async {
  // set up POST request arguments
  pr.show();
  Map<String, String> headers = {"Content-type": "application/json"};
  // String json = '{"username": "ddesantha", "password": "opwbo123"}';
  Map<String, String> mapString = {"auth_token" : globals.auth_token};
  String json = jsonEncode(mapString);
  print("Ini hasil jsonEncode : " + json);
  // make POST request

  Response response = await post(url, headers: headers, body: json);
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
  LogoutResponse loginResponse = logoutResponseFromJson(body);
  print("Ini status dari response : " + loginResponse.status);

  return loginResponse;
}