import 'package:flutter/material.dart';
import'package:flutter_verification_code_input/flutter_verification_code_input.dart';

class VerificationCode extends StatefulWidget {
  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
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
                          "Verification Code",
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
                                        "Kode verifikasi akan kami kirimkan ke nomor telepon yang telah anda masukkan. harap diisi dengan code yang telah kami kirimkan",
                                        style: new TextStyle(
                                            fontSize: 12.0, color: Colors.black38,
                                            fontFamily: "Avenir"),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Verification",
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
                                  padding: const EdgeInsets.all(8.0),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: VerificationCodeInput(
                                    keyboardType: TextInputType.number,
                                    length: 4,
                                    onCompleted: (String value) {
                                      //...
                                      print(value);
                                    },
                                  ),
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
                            onPressed: () {},
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
                        ),
                      ],
                    ),
                  )
              )),
        )
    );
  }
}
