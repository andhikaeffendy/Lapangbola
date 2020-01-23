import 'dart:async';

import 'package:dio/dio.dart' as dios;

import 'package:http/http.dart';
import 'package:lapang_bola_flutter/main.dart';
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

import 'models/playerDetail_reponse.dart';



class ChangeProfilePicture extends StatefulWidget {
  @override
  _ChangeProfilePictureState createState() => _ChangeProfilePictureState();
}

class _ChangeProfilePictureState extends State<ChangeProfilePicture> {

  final _cekKosong = TextEditingController();
  bool _validasi = false;

  void dispose(){
    _cekKosong.dispose();
    super.dispose();
  }

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

    final heightEditText = TextEditingController();
    final weightEditText = TextEditingController();
    final nationalEditText = TextEditingController();

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
                          controller: weightEditText,
                          decoration: InputDecoration(
                            labelText: 'isi aja udah',
                              errorText: _validasi ? 'cant be empty' : null,
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
                          controller: heightEditText,
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
                          controller: nationalEditText,
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
                    getUploadImg(imageFile2, heightEditText.text, weightEditText.text, nationalEditText.text).then((temp){
                      getPlayeDetailRequest();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Main()));
                      //Navigator.of(context).pop();
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

   getUploadImg(File _image, String height, String weight, String national) async {

    print("auth token = " + globals.auth_token);
    print("getUploadImg jalan . . .");


    String apiUrl = 'https://app.lapangbola.com/api/players/'+globals.playerID.toString();
    String apiUrl2 = 'https://liga.lapangbola.com/api/players/update_data';

    dios.FormData formData;
    dios.FormData formData2;

    if(_image!=null){
      print("masuk if");
      formData = new dios.FormData.fromMap({
        "auth_token" : globals.auth_token,
        "photo" : await dios.MultipartFile.fromFile(_image.path)
      });

      formData2 = new dios.FormData.fromMap({
        "phone_number" : globals.phone_number,
        "national" : national,
        "weight" : weight,
        "height" : height,
        "picture" : await dios.MultipartFile.fromFile(_image.path)
      });
    }else{
      print("masuk else");
      formData = new dios.FormData.fromMap({
        "auth_token" : globals.auth_token,
        "photo" : null
      });
      formData2 = new dios.FormData.fromMap({
        "phone_number" : globals.phone_number,
        "national" : national,
        "weight" : weight,
        "height" : height,
        "picture" : null
      });
    }

    print(formData2);

    /*final length = await _image.length();
    Map<String, String> token = { "auth_token": globals.auth_token};
    final multipartRequest = new http.MultipartRequest('PUT', Uri.parse(apiUrl));
    multipartRequest.fields["token"] = token as String;
    multipartRequest.fields["auth_token"] = globals.auth_token;
    multipartRequest.files.add(await http.MultipartFile.fromPath("photo", _image.path));

    http.Response response = await http.Response.fromStream(await multipartRequest.send());
    */

    dios.Response response = await dio.put(apiUrl, data: formData);
    dios.Response response2 = await dio.put(apiUrl2, data:formData2);

    print("ini response upload dio : " + response.toString());
    print("ini response upload dio2 : " + response2.toString());

    UploadReponse uploadReponse = uploadReponseFromJson(response.toString());

    if(uploadReponse.photoUrl!=null){
      globals.photoUrl = uploadReponse.photoUrl;
    }
    pr.hide();

    return uploadReponse;
  }
}


Future getPlayeDetailRequest() async{

  print("testasdqwas");
  String apiUrl = "https://liga.lapangbola.com/api/players/detail?phone_number="+globals.phone_number;

  Map<String, String> headers = {"Content-type": "application/json"};
  Map<String, String> mapString = {"phone_number": globals.phone_number};
  String json = jsonEncode(mapString);

  Response response = await get(apiUrl, headers: headers);

  PlayerDetailResponse playerDetailResponse = playerDetailResponseFromJson(response.body);

  globals.playerDetailReponse = playerDetailResponse;
  print("Player Detail Message " + globals.playerDetailReponse.message);

  print("Player Detail Request Donee");

  print("Club Message " + globals.clubResponse.message);

  return playerDetailResponse;
}
