import 'package:flutter/material.dart';
import 'package:lapang_bola_flutter/verification_code.dart';

class ResendVerification extends StatefulWidget {
  @override
  _ResendVerificationState createState() => _ResendVerificationState();
}

class _ResendVerificationState extends State<ResendVerification> {
  String url = "https://app.lapangbola.com/api/players/resend_activation_number?username=darpaprjct@gmail.com";

  final myController = TextEditingController();

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
                              image: new AssetImage("assets/Sign_in.png"))),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                ),
                Text(
                  "Resend Verification",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir"),
                ),Container(
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
                            "Username / Email",
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
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(8.0),
                ),SizedBox(
                  width: 320.0,
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new VerificationCode())),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.green),
                    ),
                    child: Text(
                      "SUBMIT",
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
      )
    );
  }
}
