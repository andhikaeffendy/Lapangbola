import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lapang_bola_flutter/change_profile_picture.dart';
import 'package:lapang_bola_flutter/profile_desc.dart';
import 'change_profile_picture.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _pria = false;
  bool _wanita = false;

  void _priaChanged(bool value) => setState(() => _pria = value);
  void _wanitaChanged(bool value) => setState(() => _wanita = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFFFF0),
      body: Container(
          padding: const EdgeInsets.only(top: 40.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Profile",
                    style: new TextStyle(
                        fontSize: 24.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Avenir"),
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage("assets/Grafis_profile.png"))),
                      )),
                  FlatButton.icon(
                    color: Colors.green,
                    onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new ChangeProfilePicture())),
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    label: Text("Edit Foto Profile",
                        style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Avenir")),
                  ),
                  Text(
                    "Buat akun baru",
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
                      width: 300.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Nama Depan",
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
                            padding:
                                const EdgeInsets.only(top: 12.0, bottom: 12.0),
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
                                "Nama Belakang",
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
                            padding:
                                const EdgeInsets.only(top: 12.0, bottom: 12.0),
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
                                "Email",
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
                            padding:
                                const EdgeInsets.only(top: 12.0, bottom: 12.0),
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
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 8.0),
                            child: Text(
                              "*Konfirmasi akan kami kirimkan ke email anda",
                              style: new TextStyle(
                                fontSize: 8.0,
                                color: Colors.black38,
                                  fontFamily: "Avenir"
                              ),
                            ),
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),SizedBox(
                    width: 320.0,
                    height: 45.0,
                    child: RaisedButton(
                      onPressed: (){},
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.green),
                      ),
                      child: Text(
                        "SIMPAN",
                        style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
