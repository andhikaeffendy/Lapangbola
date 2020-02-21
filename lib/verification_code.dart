import 'dart:convert';

import 'package:flutter/material.dart';
import'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:http/http.dart';
import 'package:lapang_bola_flutter/login_form.dart';
import 'models/activation_response.dart';
import 'package:lapang_bola_flutter/global/global.dart' as globals;

class VerificationCode extends StatefulWidget {
  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  String url = 'https://app.lapangbola.com/api/players/activate_account';
  String verificationNumber = "";

  final verifNumEditText1 = TextEditingController();
  final verifNumEditText2 = TextEditingController();
  final verifNumEditText3 = TextEditingController();
  final verifNumEditText4 = TextEditingController();
  final verifNumEditText5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEFFFF0),
        body: Container(
            margin: const EdgeInsets.only(top:40.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        margin: const EdgeInsets.only(top: 60.0),
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new AssetImage("assets/Verifikasi.png"))),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                  ),
                  Text(
                    "Verifikasi",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Avenir"),
                  ),
                  Container(
                      margin: const EdgeInsets.all(12.0),
                      padding: const EdgeInsets.all(30.0),
                      color: Colors.white,
                      width: 320.0,
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 180.0,
                                    child: Text(
                                      "Silahkan input kode aktivasi yang telah dikirim ke email kamu",textAlign: TextAlign.center,
                                      style: new TextStyle(
                                          fontSize: 12.0, color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Avenir"),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "",
                                  style: new TextStyle(
                                      fontSize: 12.0, color: Colors.green,
                                      fontFamily: "Avenir"),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 40.0,
                                  margin: const EdgeInsets.only(left: 12.0),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: new Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: new TextField(
                                    controller: verifNumEditText1,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 40.0,
                                  margin: const EdgeInsets.only(left: 12.0),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: new Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: new TextField(
                                    controller: verifNumEditText2,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 40.0,
                                  margin: const EdgeInsets.only(left: 12.0),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: new Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: new TextField(
                                    controller: verifNumEditText3,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 40.0,
                                  margin: const EdgeInsets.only(left: 12.0),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: new Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: new TextField(
                                    controller: verifNumEditText4,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 40.0,
                                  margin: const EdgeInsets.only(left: 12.0),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: new Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: new TextField(
                                    controller: verifNumEditText5,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),SizedBox(
                    width: 320.0,
                    height: 45.0,
                    child: RaisedButton(
                      onPressed: () {
                        verificationNumber = verifNumEditText1.text +
                            verifNumEditText2.text +
                            verifNumEditText3.text +
                            verifNumEditText4.text +
                            verifNumEditText5.text;
                        FutureBuilder<ActivationResponse>(
                            // ignore: missing_return
                            future: _makePostRequest(url, globals.phone_number, verificationNumber).then((task){
                              print("global phonenumber : " + globals.phone_number);
                              if(task.status=="success"){
                                //respon ketika benar
                                globals.phone_number = "";
                                new AlertDialog(
                                  content: new Text(task.message),
                                );

                                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Login_form()));
                              }else{
                                //respon ketika salah
                                showDialog(context: context, child:
                                new AlertDialog(
                                  content: new Text(task.message),
                                )
                                );
                              }
                            }),
                            // ignore: missing_return
                            builder: (context, snapshot){
                              if(snapshot.data.status=="success"){
                                print("ini statis dari snapshoot : " + snapshot.data.status);
                              }
                            }
                        );
                      },
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.green),
                      ),
                      child: Text(
                        "VERIFICATION",
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
        )
    );
  }
  Future<ActivationResponse> _makePostRequest(String url, String phoneNumber, String activationNumber) async {
    // set up POST request arguments
    Map<String, String> headers = {"Content-type": "application/json"};
    // String json = '{"username": "ddesantha", "password": "opwbo123"}';
    Map<String, String> mapString = {"phone_number": phoneNumber, "activation_number" : activationNumber};
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
    ActivationResponse loginResponse = activationResponseFromJson(body);
    print("Ini status dari response : " + loginResponse.status);

    return loginResponse;
  }
}
