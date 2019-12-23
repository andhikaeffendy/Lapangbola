import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'edit_statistik.dart';
import 'package:lapang_bola_flutter/global/global.dart' as globals;

class Pilih_Foto extends StatefulWidget {
  @override
  _Pilih_FotoState createState() => _Pilih_FotoState();
}

class _Pilih_FotoState extends State<Pilih_Foto> {

  Future<File> imageFile;
  File fileKirim = null;

  _openGallery(ImageSource src){
    setState(() {
      imageFile = ImagePicker.pickImage(source: src);
    });
    Navigator.of(context).pop();
  }

  _openCamera(ImageSource src) async{
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
                      onTap: (){_openCamera(ImageSource.camera);},
                      child: Container(
                        margin: EdgeInsets.only(right:16.0, top: 24.0, bottom: 18.0),
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
                                          image:
                                          new AssetImage("assets/Camera.png"))),
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
                    ),GestureDetector(
                      onTap: (){_openGallery(ImageSource.gallery);},
                      child: Container(
                        margin: EdgeInsets.only(right:16.0, top: 24.0, bottom: 18.0),
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
                                          image:
                                          new AssetImage("assets/Gallery.png"))),
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
                    ),GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.only(right:16.0, top: 24.0, bottom: 18.0),
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
                                          image:
                                          new AssetImage("assets/Files.png"))),
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

  Widget _addImage(){
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> s){
        if(s.connectionState == ConnectionState.done && s.data!=null){
          return FlatButton.icon(
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
          );
        }else if(s.error!=null){
          return Text("Error");
        }else{
          return FlatButton.icon(
            color: Colors.green,
            onPressed: () {
              _settingModalBottomSheet(context);
            },
            icon: Icon(
              Icons.attach_file,
              color: Colors.white,
              size: 15.0,
            ),
            label: Text("Tambahkan Foto",
                style: new TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Avenir")),
          );
        }
      },
    );
  }

  Widget pic(){
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> s){
        if(s.connectionState == ConnectionState.done && s.data!=null){
          globals.tempPicture = s.data;
          return Container(
            width: 300.0,
            height: 350.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new FileImage(globals.tempPicture),
                fit: BoxFit.fill
              )
            ),
          );
        }else if(s.error!=null){
          return Text("Error");
        }else{
          globals.tempPicture = null;
          return Container(
          width: 300.0,
          height: 350.0,
          color: Colors.grey,
            child: Center(
              child: Text("No Image Selected", textAlign: TextAlign.center, style: new TextStyle(color: Colors.black),),
            ),
          );
        }
      },
    );
  }

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
                ),Padding(
                  padding: EdgeInsets.all(16.0),
                ),
                pic(),
                _addImage(),
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
                Padding(
                  padding: EdgeInsets.all(24.0),
                ),
                SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Edit_Statistik())),
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


