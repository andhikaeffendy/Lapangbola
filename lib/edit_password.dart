import 'package:flutter/material.dart';

class Edit_Password extends StatefulWidget {
  @override
  _Edit_PasswordState createState() => _Edit_PasswordState();
}

class _Edit_PasswordState extends State<Edit_Password> {

  bool _isHidePassword = true;

  void _tooglePasswordVisible(){
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

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
                          "Ganti Password",
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "New Password",
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
                                ),Row(
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
                                ),Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Old Password",
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
                              "SAVE",
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
}
