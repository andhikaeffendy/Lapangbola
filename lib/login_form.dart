import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'lupa_password.dart';
import 'main.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Lapangbola';
  static const BgColors = const Color(0xffEFFFF0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: BgColors,
      ),
      home: Login_form(),
    );
  }
}

class Login_form extends StatefulWidget {
  @override
  _Login_formState createState() => _Login_formState();
}

class _Login_formState extends State<Login_form> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEFFFF0),
        body: Center(
          child: Container(
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
                      "Login",
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
                                  "Email",
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
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12.0),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1.0),
                                        borderRadius:
                                        BorderRadius.circular(15.0))),
                              ),
                            ),
                            GestureDetector(
                              onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) => new LupaPassword())),
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
                        onPressed: ()=> Navigator.of(context).push(FadeRoute(page: MyStatefulWidget())),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.green),
                        ),
                        child: Text(
                          "LOGIN",
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
        ));
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}