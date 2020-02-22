import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lapang_bola_flutter/models/registration_response.dart';
import 'package:lapang_bola_flutter/verification_code.dart';
import 'verification_code.dart';
import 'package:lapang_bola_flutter/global/global.dart' as globals;

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool _isHidePassword = true;

  void _tooglePasswordVisible(){
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  String url = 'https://app.lapangbola.com/api/players';

  final nameEditText = TextEditingController();
  final emailEditText = TextEditingController();
  final userNameEditText = TextEditingController();
  final passEditText = TextEditingController();
  final passConfirmEditText = TextEditingController();
  final phoneNumberEditText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEFFFF0),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 40.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 210.0,
                          height: 35.0,
                          margin: const EdgeInsets.only(top: 8.0),
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage("assets/Logo.png"))),
                        )),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 140.0,
                          height: 140.0,
                          margin: const EdgeInsets.only(top: 40.0),
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage("assets/Register.png"))),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                    ),
                    Text(
                      "Registration",
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir"),
                    ),
                    Container(
                        margin: const EdgeInsets.all(12.0),
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.white,
                        width: 320.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  "Full Name",
                                  style: new TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontFamily: "Avenir"),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                              child: TextField(
                                controller: nameEditText,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12.0),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1.0),
                                        borderRadius:
                                        BorderRadius.circular(15.0))),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  "Username",
                                  style: new TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontFamily: "Avenir"),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                              child: TextField(
                                controller: userNameEditText,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12.0),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1.0),
                                        borderRadius:
                                        BorderRadius.circular(15.0))),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Email",
                                  style: new TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontFamily: "Avenir"),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                              child: TextField(
                                controller: emailEditText,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12.0),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1.0),
                                        borderRadius:
                                        BorderRadius.circular(15.0))),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Password",
                                  style: new TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontFamily: "Avenir"),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                              child: TextField(
                                controller: passEditText,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _isHidePassword,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12.0),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1.0),
                                        borderRadius:
                                        BorderRadius.circular(15.0)),
                                suffixIcon: GestureDetector(
                                  onTap: (){_tooglePasswordVisible();},
                                  child: Icon(
                                    _isHidePassword ? Icons.visibility_off : Icons.visibility,
                                    color: _isHidePassword ? Colors.green : Colors.greenAccent,
                                  ),
                                ),),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Confirm Password",
                                  style: new TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontFamily: "Avenir"),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                              child: TextField(
                                controller: passConfirmEditText,
                                obscureText: _isHidePassword,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12.0),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1.0),
                                        borderRadius:
                                        BorderRadius.circular(15.0)),
                                    suffixIcon: GestureDetector(
                                      onTap: (){_tooglePasswordVisible();},
                                      child: Icon(
                                        _isHidePassword ? Icons.visibility_off : Icons.visibility,
                                        color: _isHidePassword ? Colors.green : Colors.greenAccent,
                                      ),
                                    )),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  "Phone Number",
                                  style: new TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontFamily: "Avenir"),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                              child: TextField(
                                controller: phoneNumberEditText,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12.0),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1.0),
                                        borderRadius:
                                        BorderRadius.circular(15.0))),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),SizedBox(
                      width: 320.0,
                      height: 45.0,
                      child: RaisedButton(
                        //onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new VerificationCode())),
                        onPressed: (){
                          FutureBuilder<RegistrationReponse>(
                              future: _makePostRequest(url,userNameEditText.text,passEditText.text,
                              nameEditText.text,phoneNumberEditText.text,passConfirmEditText.text,
                              emailEditText.text).then((task){
                                print("ini asal global : " + globals.auth_token);
                                print("global is_login : " + globals.is_Login.toString());
                                if(task.status=="success"){
                                  //respon ketika benar
                                  globals.phone_number = phoneNumberEditText.text;
                                  new AlertDialog(
                                    content: new Text(task.message),
                                  );
                                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new VerificationCode()));
                                }else{
                                  //respon ketika salah
                                  showDialog(context: context, child:
                                  new AlertDialog(
                                    content: new Text(task.message),
                                  )
                                  );
                                }
                                return null;
                              }),
                              builder: (context, snapshot){
                                if(snapshot.data.status=="success"){
                                  print("ini statis dari snapshoot : " + snapshot.data.status);
                                }
                                return null;
                              }

                          );
                        },
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.green),
                        ),
                        child: Text(
                          "Register",
                          style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        )
    );
  }
  
  Future<RegistrationReponse> _makePostRequest(String url, String username, String password,
      String name, String phoneNumber, String confirmPassword, String email) async {
    // set up POST request arguments
    Map<String, String> headers = {"Content-type": "application/json"};
    // String json = '{"username": "ddesantha", "password": "opwbo123"}';
    Map<String, String> mapString = {
      "username": username,
      "password" : password,
      "name" : name,
      "phone_number" : phoneNumber,
      "password_confirmation" : confirmPassword,
      "email" : email};
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
    RegistrationReponse loginResponse = registrationReponseFromJson(body);
    print("Ini status dari response : " + loginResponse.status);

    return loginResponse;
  }
}
