// To parse this JSON data, do
//
//     final myMatchResponse = myMatchResponseFromJson(jsonString);

import 'dart:convert';

MyMatchResponse myMatchResponseFromJson(String str) => MyMatchResponse.fromJson(json.decode(str));

String myMatchResponseToJson(MyMatchResponse data) => json.encode(data.toJson());

class MyMatchResponse {
  String status;
  String message;
  List<Datum> data;

  MyMatchResponse({
    this.status,
    this.message,
    this.data ,
  });

  factory MyMatchResponse.fromJson(Map<String, dynamic> json) => MyMatchResponse(
    status: json["status"],
    message: json["message"],
    //data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String stadium;
  int id;
  String homeName;
  String homeImage;
  String awayName;
  String awayImage;
  int homeScore;
  int awayScore;
  int shareableStatus;

  Datum({
    this.stadium,
    this.id,
    this.homeName,
    this.homeImage,
    this.awayName,
    this.awayImage,
    this.homeScore,
    this.awayScore,
    this.shareableStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    stadium: json["stadium"],
    id: json["id"],
    homeName: json["home_name"],
    homeImage: "http://liga.lapangbola.com"+json["home_image"],
    awayName: json["away_name"],
    awayImage: "http://liga.lapangbola.com"+json["away_image"],
    homeScore: json["home_score"],
    awayScore: json["away_score"],
    shareableStatus: json["shareable_status"],
  );

  Map<String, dynamic> toJson() => {
    "stadium": stadium,
    "id": id,
    "home_name": homeName,
    "home_image": homeImage,
    "away_name": awayName,
    "away_image": awayImage,
    "home_score": homeScore,
    "away_score": awayScore,
    "shareable_status": shareableStatus,
  };
}
