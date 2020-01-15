// To parse this JSON data, do
//
//     final liveResponse = liveResponseFromJson(jsonString);

import 'dart:convert';

LiveResponse liveResponseFromJson(String str) => LiveResponse.fromJson(json.decode(str));

String liveResponseToJson(LiveResponse data) => json.encode(data.toJson());

class LiveResponse {
  String status;
  String message;
  List<Datum> data;

  LiveResponse({
    this.status,
    this.message,
    this.data,
  });

  factory LiveResponse.fromJson(Map<String, dynamic> json) => LiveResponse(
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
  String name;
  List<MatchesCollection> matchesCollection;

  Datum({
    this.id,
    this.name,
    this.matchesCollection,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    matchesCollection: List<MatchesCollection>.from(json["matches_collection"].map((x) => MatchesCollection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "matches_collection": List<dynamic>.from(matchesCollection.map((x) => x.toJson())),
  };
}

class MatchesCollection {
  String stadium;
  String matchDate;
  int id;
  String homeName;
  String homeImage;
  String awayName;
  String awayImage;
  int homeScore;
  int awayScore;
  String minute;

  MatchesCollection({
    this.stadium,
    this.matchDate,
    this.id,
    this.homeName,
    this.homeImage,
    this.awayName,
    this.awayImage,
    this.homeScore,
    this.awayScore,
    this.minute,
  });

  factory MatchesCollection.fromJson(Map<String, dynamic> json) => MatchesCollection(
    stadium: json["stadium"],
    matchDate: json["match_date"] == null ? null : json["match_date"],
    id: json["id"],
    homeName: json["home_name"],
    homeImage: json["home_image"],
    awayName: json["away_name"],
    awayImage: json["away_image"],
    homeScore: json["home_score"],
    awayScore: json["away_score"],
    minute: json["minute"],
  );

  Map<String, dynamic> toJson() => {
    "stadium": stadium,
    "match_date": matchDate == null ? null : matchDate,
    "id": id,
    "home_name": homeName,
    "home_image": homeImage,
    "away_name": awayName,
    "away_image": awayImage,
    "home_score": homeScore,
    "away_score": awayScore,
    "minute": minute,
  };
}
