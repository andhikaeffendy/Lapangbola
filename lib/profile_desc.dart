import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import 'desc_team.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lapang_bola_flutter/models/logout_response.dart';
import 'package:lapang_bola_flutter/pilih_foto.dart';
import 'package:lapang_bola_flutter/profile.dart';
import 'package:lapang_bola_flutter/statistik.dart';
import 'change_profile_picture.dart';
import 'login_form.dart';
import 'models/playerDetail_reponse.dart';
import 'profile.dart';
import 'statistik.dart';
import 'package:lapang_bola_flutter/global/global.dart' as globals;
import 'package:progress_dialog/progress_dialog.dart';
import 'edit_password.dart';

ProgressDialog pr;
String imageUrl = "https://app.lapangbola.com";


class Profile_Desc extends StatefulWidget {
  @override
  _Profile_DescState createState() => _Profile_DescState();
}

class _Profile_DescState extends State<Profile_Desc> {

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

  @override
  Widget build(BuildContext context) {


    if(globals.playerDetailReponse.status.toLowerCase()=="fail"){
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            backgroundColor: Color(0xffEFFFF0),
            body: Container(
              padding: const EdgeInsets.only(top: 40.0),
              child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          height: 350.0,
                         child: Center(
                           child: Text(globals.playerDetailReponse.message,
                             style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,
                                 fontFamily: "Avenir"), textAlign: TextAlign.center,),
                         ),
                        )
                        ,
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
                      ]),
                  ),
              ),
            ),
          )
        );

    }else{
      print("Image URL + Global = " + imageUrl+globals.photoUrl);
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
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
                                                    imageUrl+globals.photoUrl))),
                                      )),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: GestureDetector(
                                          onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                                              builder: (BuildContext context) => new ChangeProfilePicture())),
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
                                    child: Container(
                                      width: 200.0,
                                      child: Text(
                                        globals.name,
                                        style: new TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
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
                                    "Play",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Avenir"),
                                  ),Text(
                                    globals.playerDetailReponse.games.toString(),
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
                                    "Goal",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Avenir"),
                                  ),Text(
                                    globals.playerDetailReponse.totalGoal.toString(),
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
                                    "Assist",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Avenir"),
                                  ),Text(
                                    globals.playerDetailReponse.totalAssist.toString(),
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
                                    "Red Card",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Avenir"),
                                  ),Text(
                                    globals.playerDetailReponse.totalRedCard.toString(),
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
                                    "Yellow Card",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Avenir"),
                                  ),Text(
                                    globals.playerDetailReponse.totalYellowCard.toString(),
                                    style: new TextStyle(
                                        fontSize: 18.0,
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
                                    builder: (BuildContext context) => new Desc_Team())),
                                child: Text(
                                  globals.playerDetailReponse.clubName,
                                  style: new TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontFamily: "Avenir"),
                                ),
                              ),Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Nationality",
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Avenir"),
                                ),
                              ),Text(
                                globals.playerDetailReponse.national,
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontFamily: "Avenir"),
                              ),/*Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Date of Birth",
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Avenir"),
                                ),
                              ),Text(
                                "08/12/1986",
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontFamily: "Avenir"),
                              ),Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Age",
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Avenir"),
                                ),
                              ),Text(
                                "33",
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontFamily: "Avenir"),
                              ),*/Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Height",
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Avenir"),
                                ),
                              ),Text(
                                globals.playerDetailReponse.height.toString() + " cm",
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontFamily: "Avenir"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Weight",
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Avenir"),
                                ),
                              ),Text(
                              globals.playerDetailReponse.weight.toString() + " kg",
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontFamily: "Avenir"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),SizedBox(
                          width: 320.0,
                          height: 45.0,
                          child: RaisedButton(
                            onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new Edit_Password())),
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                              side: BorderSide(color: Colors.green),
                            ),
                            child: Text(
                              "Edit Password",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
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
                        ),SizedBox(
                          width: 100.0,
                          height: 100.0,
                        )
                      ],
                    ),
                  )
              ),
            ),

          ),
        );
      }
    }
}

void _showDialog(BuildContext context) {
  String url = "https://app.lapangbola.com/api/players/sign_out";

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
                _makePostRequest(url, context).then((task) async {
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
                    globals.playerDetailReponse = null;
                    globals.clubResponse = null;

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.remove("username");
                    prefs.remove("password");

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

