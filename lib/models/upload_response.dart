// To parse this JSON data, do
//
//     final uploadReponse = uploadReponseFromJson(jsonString);

import 'dart:convert';

UploadReponse uploadReponseFromJson(String str) => UploadReponse.fromJson(json.decode(str));

String uploadReponseToJson(UploadReponse data) => json.encode(data.toJson());

class UploadReponse {
  String photoUrl;
  String status;
  String message;

  UploadReponse({
    this.photoUrl,
    this.status,
    this.message,
  });

  factory UploadReponse.fromJson(Map<String, dynamic> json) => UploadReponse(
    photoUrl: json["photo_url"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "photo_url": photoUrl,
    "status": status,
    "message": message,
  };
}
