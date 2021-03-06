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
  List<MatchDate> matchDates;

  Datum({
    this.id,
    this.name,
    this.matchDates,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    matchDates: List<MatchDate>.from(json["match_dates"].map((x) => MatchDate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "match_dates": List<dynamic>.from(matchDates.map((x) => x.toJson())),
  };
}

class MatchDate {
  String matchDate;
  List<MatchesCollection> matchesCollection;

  MatchDate({
    this.matchDate,
    this.matchesCollection,
  });

  factory MatchDate.fromJson(Map<String, dynamic> json) => MatchDate(
    matchDate: json["match_date"],
    matchesCollection: List<MatchesCollection>.from(json["matches_collection"].map((x) => MatchesCollection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "match_date": matchDate,
    "matches_collection": List<dynamic>.from(matchesCollection.map((x) => x.toJson())),
  };
}

class MatchesCollection {
  String stadium;
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
    id: json["id"],
    homeName: json["home_name"],
    homeImage: "http://liga.lapangbola.com"+json["home_image"],
    awayName: json["away_name"],
    awayImage: "http://liga.lapangbola.com"+json["away_image"],
    homeScore: json["home_score"],
    awayScore: json["away_score"],
    minute: json["minute"],
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
    "minute": minute,
  };
}
