import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChangeProfilePicture extends StatefulWidget {
  @override
  _ChangeProfilePictureState createState() => _ChangeProfilePictureState();
}

class _ChangeProfilePictureState extends State<ChangeProfilePicture> {
  Future<File> imageFile;

  _openGallery(ImageSource src) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: src);
    });
    Navigator.of(context).pop();
  }

  _openCamera(ImageSource src) async {
    setState(() {
      imageFile = ImagePicker.pickImage(source: src);
    });
    Navigator.of(context).pop();
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 200.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Select Source",
                  style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _openCamera(ImageSource.camera);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 16.0, top: 24.0, bottom: 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new AssetImage(
                                              "assets/Camera.png"))),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Camera",
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _openGallery(ImageSource.gallery);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 16.0, top: 24.0, bottom: 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new AssetImage(
                                              "assets/Gallery.png"))),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Gallery",
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 16.0, top: 24.0, bottom: 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new AssetImage(
                                              "assets/Files.png"))),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Files",
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget pic() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> s) {
        if (s.connectionState == ConnectionState.done && s.data != null) {
          return Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: 150.0,
                  height: 150.0,
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new FileImage(s.data),
                      ))));
        } else if (s.error != null) {
          return Text("Error");
        } else {
          return Align(
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
              ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFFFF0),
      body: Container(
        padding: EdgeInsets.only(top: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Change Profile Picture",
              style: new TextStyle(
                  fontSize: 24.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Avenir"),
            ),
            pic(),
            FlatButton.icon(
              color: Colors.green,
              onPressed: () {
                _settingModalBottomSheet(context);
              },
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
            ),Padding(
              padding: const EdgeInsets.all(16.0),
            ),SizedBox(
              width: 140.0,
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
            )
          ],
        ),
      ),
    );
  }
}
