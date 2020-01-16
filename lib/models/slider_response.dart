// To parse this JSON data, do
//
//     final sliderResponse = sliderResponseFromJson(jsonString);

import 'dart:convert';

SliderResponse sliderResponseFromJson(String str) => SliderResponse.fromJson(json.decode(str));

String sliderResponseToJson(SliderResponse data) => json.encode(data.toJson());

class SliderResponse {
  String status;
  String message;
  List<Datum> data;

  SliderResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SliderResponse.fromJson(Map<String, dynamic> json) => SliderResponse(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String title;
  String body;
  String photoUrl;

  Datum({
    this.id,
    this.title,
    this.body,
    this.photoUrl,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    photoUrl: "http://app.lapangbola.com"+json["photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "photo_url": photoUrl,
  };
}
