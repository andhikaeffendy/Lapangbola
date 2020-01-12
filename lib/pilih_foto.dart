import 'dart:async';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'edit_statistik.dart';
import 'package:lapang_bola_flutter/global/global.dart' as globals;
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' as path;

class Pilih_Foto extends StatefulWidget {
  @override
  _Pilih_FotoState createState() => _Pilih_FotoState();
}

class _Pilih_FotoState extends State<Pilih_Foto> {
  File imageFile;
  File gambar = null;

//  _openGallery(ImageSource src) {
//    var image = await ImagePicker.pickImage(source: src);
//    var ext = path.extension(image.path);
//    File cropImage = await ImageCropper.cropImage(sourcePath: ext,maxHeight: 350,maxWidth: 300);
//
//    setState(() {
//      imageFile = ImagePicker.pickImage(source: src);
//    });
//    Navigator.of(context).pop();
//  }

//  Future<Null> _openCamera(ImageSource src) {
//    var image = await ImagePicker.pickImage(source: src);
//    var ext = path.extension(image.path);
//    File cropImage = await ImageCropper.cropImage(sourcePath: ext,maxHeight: 350,maxWidth: 300);
//    setState(() {
//      imageFile = ImagePicker.pickImage(source: src);
//    });
//    Navigator.of(context).pop();
//  }

  getImageFile(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
//          CropAspectRatioPreset.ratio3x2,
//          CropAspectRatioPreset.ratio4x3,
//          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Color(0xffEFFFF0),
            toolbarWidgetColor: Colors.green,
            cropFrameColor: Colors.green,
            statusBarColor: Colors.green,
            activeControlsWidgetColor: Colors.green,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    setState(() {
      globals.tempPicture = croppedFile;
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
                      onTap: () => getImageFile(ImageSource.camera),
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
                      onTap: () => getImageFile(ImageSource.gallery),
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

//  Widget _decideImageView(){
//    if(imageFile == null){
//      return Container(
//          width: 300.0,
//          height: 350.0,
//          color: Colors.grey,
//      );
//    }else(
//      Image.file(imageFile, width: 300,height: 350,)
//    );
//  }

//  Widget _addImage(){
//    return FutureBuilder<File>(
//      future: imageFile,
//      builder: (BuildContext context, AsyncSnapshot<File> s){
//        if(s.connectionState == ConnectionState.done && s.data!=null){
//          return FlatButton.icon(
//            color: Colors.green,
//            onPressed: () {
//              _settingModalBottomSheet(context);
//            },
//            icon: Icon(
//              Icons.attach_file,
//              color: Colors.white,
//              size: 15.0,
//            ),
//            label: Text("Ganti Foto",
//                style: new TextStyle(
//                    fontSize: 12.0,
//                    color: Colors.white,
//                    fontWeight: FontWeight.bold,
//                    fontFamily: "Avenir")),
//          );
//        }else if(s.error!=null){
//          return Text("Error");
//        }else{
//          return FlatButton.icon(
//            color: Colors.green,
//            onPressed: () {
//              _settingModalBottomSheet(context);
//            },
//            icon: Icon(
//              Icons.attach_file,
//              color: Colors.white,
//              size: 15.0,
//            ),
//            label: Text("Tambahkan Foto",
//                style: new TextStyle(
//                    fontSize: 12.0,
//                    color: Colors.white,
//                    fontWeight: FontWeight.bold,
//                    fontFamily: "Avenir")),
//          );
//        }
//      },
//    );
//  }

//  Widget pic(){
//    return FutureBuilder<File>(
//      future: imageFile,
//      builder: (BuildContext context, AsyncSnapshot<File> s){
//        if(s.connectionState == ConnectionState.done && s.data!=null){
//          globals.tempPicture = s.data;
//          return Container(
//            width: 300.0,
//            height: 350.0,
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: new FileImage(globals.tempPicture),
//                fit: BoxFit.fill
//              )
//            ),
//          );
//        }else if(s.error!=null){
//          return Text("Error");
//        }else{
//          globals.tempPicture = null;
//          return Container(
//          width: 300.0,
//          height: 350.0,
//          color: Colors.grey,
//            child: Center(
//              child: Text("No Image Selected", textAlign: TextAlign.center, style: new TextStyle(color: Colors.black),),
//            ),
//          );
//        }
//      },
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFFFF0),
      body: Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Pilih Foto",
                  style: new TextStyle(
                      fontSize: 24.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir"),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                ),
//                pic(),
//                _addImage(),
//                FlatButton.icon(
//                  color: Colors.white,
//                  onPressed: () {
//                    _settingModalBottomSheet(context);
//                  },
//                  icon: Icon(
//                    Icons.attach_file,
//                    color: Colors.green,
//                  ),
//                  label: Text("Pilih Foto",
//                      style: new TextStyle(
//                          fontSize: 12.0,
//                          color: Colors.green,
//                          fontWeight: FontWeight.bold,
//                          fontFamily: "Avenir")),
//                ),
                Container(
                  width: 300.0,
                  height: 350.0,
                  child: globals.tempPicture == null
                      ? Container(
                          width: 300.0,
                          height: 350.0,
                          color: Colors.grey,
                        )
                      : Image.file(
                          globals.tempPicture,
                          height: 350.0,
                          width: 300.0,
                        ),
                ),
                FlatButton.icon(
                  color: Colors.green,
                  onPressed: () {
                    _settingModalBottomSheet(context);
                  },
                  icon: Icon(
                    Icons.attach_file,
                    color: Colors.white,
                    size: 15.0,
                  ),
                  label: Text("Ganti Foto",
                      style: new TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir")),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                ),
                SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new Edit_Statistik())),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.green),
                    ),
                    child: Text(
                      "LANJUT",
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                ),
                SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.grey),
                    ),
                    child: Text(
                      "CANCEL",
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
