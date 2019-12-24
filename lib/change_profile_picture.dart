import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lapang_bola_flutter/global/global.dart' as globals;



class ChangeProfilePicture extends StatefulWidget {
  @override
  _ChangeProfilePictureState createState() => _ChangeProfilePictureState();
}

class _ChangeProfilePictureState extends State<ChangeProfilePicture> {
  Future<File> imageFile;
  File imageFile2;


  _openGallery(ImageSource src, BuildContext context) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: src);
    });
    Navigator.of(context).pop();
  }

  _openCamera(ImageSource src, BuildContext context) async {
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
                        _openCamera(ImageSource.camera, context);
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
                        _openGallery(ImageSource.gallery, context);
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
          imageFile2 = s.data;
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
    print("photo url : "+globals.photoUrl);

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
                onPressed: (){
                  // upload disini
                },
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

  upload(File imageFile) async {
    //url
    var url = "https://app.lapangbola.com/api/players/"+globals.playerID.toString();

    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    //var uri = Uri.parse("http://ip:8082/composer/predict");
    var uri = Uri.parse(url);

    // create multipart request
    var request = new http.MultipartRequest("PUT", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }
}
