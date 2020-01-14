import 'package:dio/dio.dart' as dios;

import 'package:http/http.dart';
import 'package:lapang_bola_flutter/models/upload_response.dart';
import 'package:lapang_bola_flutter/profile_desc.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lapang_bola_flutter/global/global.dart' as globals;
import 'package:progress_dialog/progress_dialog.dart';



class ChangeProfilePicture extends StatefulWidget {
  @override
  _ChangeProfilePictureState createState() => _ChangeProfilePictureState();
}

class _ChangeProfilePictureState extends State<ChangeProfilePicture> {
  Future<File> imageFile;
  File imageFile2;
  dios.Dio dio = new dios.Dio();
  ProgressDialog pr;


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

    pr = new ProgressDialog(context,type: ProgressDialogType.Normal);
    pr.style(message: "Uploading...");

    return Scaffold(
      backgroundColor: Color(0xffEFFFF0),
      body: Container(
        padding: EdgeInsets.only(top: 40.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Edit Profile",
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
                padding: const EdgeInsets.all(8.0),
              ),Container(
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
                            "Weight",
                            style: new TextStyle(
                                fontSize: 16.0, color: Colors.black,
                                fontFamily: "Avenir"),
                          ),
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
                            "Height",
                            style: new TextStyle(
                                fontSize: 16.0, color: Colors.black,
                                fontFamily: "Avenir"),
                          ),
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
                            "National",
                            style: new TextStyle(
                                fontSize: 16.0, color: Colors.black,
                                fontFamily: "Avenir"),
                          ),
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
                    ],
                  ))
              ,SizedBox(
                width: 140.0,
                height: 45.0,
                child: RaisedButton(
                  onPressed: (){
                    //upload disini
                    pr.show();
                    getUploadImg(imageFile2).then((temp){
                      Navigator.of(context).pop();
                    });
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
      ),
    );
  }

  _makePutRequest(Image imageFile) async {
    // set up PUT request arguments
    String url = 'https://app.lapangbola.com/api/players/'+globals.playerID.toString();
    Map<String, String> headers = {"Content-type": "application/json"};

    Map<String, String> mapString = {"auth_token": globals.auth_token, "photo" : "photo"};
    String json = jsonEncode(mapString);
    // make PUT request
    //Response response = await put(url, headers: headers, body: json);
    // check the status code for the result
    //int statusCode = response.statusCode;
    // this API passes back the updated item with the id added
    //String body = response.body;
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 1
    // }
  }

  Future getUploadImg(File _image) async {

    print("auth token = " + globals.auth_token);
    print("getUploadImg jalan . . .");
    print("Ini image = " + _image.path);

    String apiUrl = 'https://app.lapangbola.com/api/players/'+globals.playerID.toString();

    dios.FormData formData = new dios.FormData.fromMap({
      "auth_token" : globals.auth_token,
      "photo" : await dios.MultipartFile.fromFile(_image.path)
    });

    /*final length = await _image.length();
    Map<String, String> token = { "auth_token": globals.auth_token};
    final multipartRequest = new http.MultipartRequest('PUT', Uri.parse(apiUrl));
    multipartRequest.fields["token"] = token as String;
    multipartRequest.fields["auth_token"] = globals.auth_token;
    multipartRequest.files.add(await http.MultipartFile.fromPath("photo", _image.path));

    http.Response response = await http.Response.fromStream(await multipartRequest.send());
    */

    dios.Response response = await dio.put(apiUrl, data: formData);

    print("ini response upload dio " + response.toString());

    UploadReponse uploadReponse = uploadReponseFromJson(response.toString());

    globals.photoUrl = uploadReponse.photoUrl;
    pr.hide();

    return uploadReponse;
  }
}
