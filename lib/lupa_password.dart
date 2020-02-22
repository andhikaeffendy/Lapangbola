import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lapang_bola_flutter/login_form.dart';
import 'models/forgetpass_response.dart';
import 'dart:convert';

class LupaPassword extends StatefulWidget {
  @override
  _LupaPasswordState createState() => _LupaPasswordState();

}

class _LupaPasswordState extends State<LupaPassword> {

  String url = "https://app.lapangbola.com/api/players/forgot_password";

  final phoneNumberTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEFFFF0),
        body: Center(
          child: Container(
              child: SingleChildScrollView(
                  child: Center(
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
                              margin: const EdgeInsets.only(top: 40.0),
                              decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new AssetImage("assets/Lupa_password.png"))),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        Text(
                          "Lupa Password",
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0, top: 12.0),
                                      child: Text(
                                        "Lupa password anda? masukkan nomor telepon anda dan kami akan mengirimkan intruksi pemulihan password anda",
                                        style: new TextStyle(
                                            fontSize: 12.0, color: Colors.black38,
                                            fontFamily: "Avenir"),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Nomor Telepon",
                                      style: new TextStyle(
                                          fontSize: 16.0, color: Colors.black,
                                          fontFamily: "Avenir"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "*Harus Diisi",
                                        style: new TextStyle(
                                            fontSize: 12.0, color: Colors.green,
                                            fontFamily: "Avenir"),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 12.0),
                                  child: TextField(
                                    controller: phoneNumberTextController,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(12.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26, width: 1.0),
                                            borderRadius:
                                            BorderRadius.circular(15.0))),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Text(
                                          "Lupa Password?",
                                          style: new TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                              fontFamily: "Avenir"),
                                        ),
                                      )
                                    ],
                                  ),
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
                              FutureBuilder<ForgetpassReponse>(
                                  future: _makePostRequest(url, phoneNumberTextController.text).then((task){
                                    if(task.status=="success"){
                                      //respon ketika benar
                                      Navigator.of(context).push(FadeRoute(page: Login_form()));
                                      showDialog(context: context, child:
                                      new AlertDialog(
                                        content: new Text("New password has been sent"),
                                      )
                                      );

                                    }else{
                                      //respon ketika salah
                                      //Navigator.pop(context, task.message);
                                      showDialog(context: context, child:
                                        new AlertDialog(
                                          content: new Text(task.message),
                                        )
                                      );
                                    }
                                  }),
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
                              "SEND",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              )),
        ));
  }

  Future<ForgetpassReponse> _makePostRequest(String url, String phone_number) async {
    // set up POST request arguments
    Map<String, String> headers = {"Content-type": "application/json"};
    // String json = '{"username": "ddesantha", "password": "opwbo123"}';
    Map<String, String> mapString = {"phone_number": phone_number};
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
    ForgetpassReponse loginResponse = forgetpassReponseFromJson(body);
    print("Ini status dari response : " + loginResponse.status);

    return loginResponse;
  }
}
