// To parse this JSON data, do
//
//     final matchDetailResponse = matchDetailResponseFromJson(jsonString);

import 'dart:convert';

MatchDetailResponse matchDetailResponseFromJson(String str) => MatchDetailResponse.fromJson(json.decode(str));

String matchDetailResponseToJson(MatchDetailResponse data) => json.encode(data.toJson());

class MatchDetailResponse {
  int id;
  String matchDate;
  String homeClubName;
  String awayClubName;
  int homeScore;
  int awayScore;
  int goalHome;
  int goalAway;
  int owngoalHome;
  int owngoalAway;
  int shootonHome;
  int shootonAway;
  int shootoffHome;
  int shootoffAway;
  int shootblockHome;
  int shootblockAway;
  int tackleHome;
  int tackleAway;
  int passHome;
  int passAway;
  int crossHome;
  int crossAway;
  int interceptHome;
  int interceptAway;
  int offsideHome;
  int offsideAway;
  int cornerHome;
  int cornerAway;
  int foulHome;
  int foulAway;
  int clearanceHome;
  int clearanceAway;
  int redHome;
  int redAway;
  int yellowHome;
  int yellowAway;
  int possHome;
  int possAway;
  int penaltymissHome;
  int penaltymissAway;
  int accuracyHome;
  int accuracyAway;
  List<dynamic> homeMatchGoals;
  List<dynamic> awayMatchGoals;
  String status;
  String message;

  MatchDetailResponse({
    this.id,
    this.matchDate,
    this.homeClubName,
    this.awayClubName,
    this.homeScore,
    this.awayScore,
    this.goalHome,
    this.goalAway,
    this.owngoalHome,
    this.owngoalAway,
    this.shootonHome,
    this.shootonAway,
    this.shootoffHome,
    this.shootoffAway,
    this.shootblockHome,
    this.shootblockAway,
    this.tackleHome,
    this.tackleAway,
    this.passHome,
    this.passAway,
    this.crossHome,
    this.crossAway,
    this.interceptHome,
    this.interceptAway,
    this.offsideHome,
    this.offsideAway,
    this.cornerHome,
    this.cornerAway,
    this.foulHome,
    this.foulAway,
    this.clearanceHome,
    this.clearanceAway,
    this.redHome,
    this.redAway,
    this.yellowHome,
    this.yellowAway,
    this.possHome,
    this.possAway,
    this.penaltymissHome,
    this.penaltymissAway,
    this.accuracyHome,
    this.accuracyAway,
    this.homeMatchGoals,
    this.awayMatchGoals,
    this.status,
    this.message,
  });

  factory MatchDetailResponse.fromJson(Map<String, dynamic> json) => MatchDetailResponse(
    id: json["id"],
    matchDate: json["match_date"],
    homeClubName: json["home_club_name"],
    awayClubName: json["away_club_name"],
    homeScore: json["home_score"],
    awayScore: json["away_score"],
    goalHome: json["goal_home"],
    goalAway: json["goal_away"],
    owngoalHome: json["owngoal_home"],
    owngoalAway: json["owngoal_away"],
    shootonHome: json["shooton_home"],
    shootonAway: json["shooton_away"],
    shootoffHome: json["shootoff_home"],
    shootoffAway: json["shootoff_away"],
    shootblockHome: json["shootblock_home"],
    shootblockAway: json["shootblock_away"],
    tackleHome: json["tackle_home"],
    tackleAway: json["tackle_away"],
    passHome: json["pass_home"],
    passAway: json["pass_away"],
    crossHome: json["cross_home"],
    crossAway: json["cross_away"],
    interceptHome: json["intercept_home"],
    interceptAway: json["intercept_away"],
    offsideHome: json["offside_home"],
    offsideAway: json["offside_away"],
    cornerHome: json["corner_home"],
    cornerAway: json["corner_away"],
    foulHome: json["foul_home"],
    foulAway: json["foul_away"],
    clearanceHome: json["clearance_home"],
    clearanceAway: json["clearance_away"],
    redHome: json["red_home"],
    redAway: json["red_away"],
    yellowHome: json["yellow_home"],
    yellowAway: json["yellow_away"],
    possHome: json["poss_home"],
    possAway: json["poss_away"],
    penaltymissHome: json["penaltymiss_home"],
    penaltymissAway: json["penaltymiss_away"],
    accuracyHome: json["accuracy_home"],
    accuracyAway: json["accuracy_away"],
    homeMatchGoals: List<dynamic>.from(json["home_match_goals"].map((x) => x)),
    awayMatchGoals: List<dynamic>.from(json["away_match_goals"].map((x) => x)),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "match_date": matchDate,
    "home_club_name": homeClubName,
    "away_club_name": awayClubName,
    "home_score": homeScore,
    "away_score": awayScore,
    "goal_home": goalHome,
    "goal_away": goalAway,
    "owngoal_home": owngoalHome,
    "owngoal_away": owngoalAway,
    "shooton_home": shootonHome,
    "shooton_away": shootonAway,
    "shootoff_home": shootoffHome,
    "shootoff_away": shootoffAway,
    "shootblock_home": shootblockHome,
    "shootblock_away": shootblockAway,
    "tackle_home": tackleHome,
    "tackle_away": tackleAway,
    "pass_home": passHome,
    "pass_away": passAway,
    "cross_home": crossHome,
    "cross_away": crossAway,
    "intercept_home": interceptHome,
    "intercept_away": interceptAway,
    "offside_home": offsideHome,
    "offside_away": offsideAway,
    "corner_home": cornerHome,
    "corner_away": cornerAway,
    "foul_home": foulHome,
    "foul_away": foulAway,
    "clearance_home": clearanceHome,
    "clearance_away": clearanceAway,
    "red_home": redHome,
    "red_away": redAway,
    "yellow_home": yellowHome,
    "yellow_away": yellowAway,
    "poss_home": possHome,
    "poss_away": possAway,
    "penaltymiss_home": penaltymissHome,
    "penaltymiss_away": penaltymissAway,
    "accuracy_home": accuracyHome,
    "accuracy_away": accuracyAway,
    "home_match_goals": List<dynamic>.from(homeMatchGoals.map((x) => x)),
    "away_match_goals": List<dynamic>.from(awayMatchGoals.map((x) => x)),
    "status": status,
    "message": message,
  };
}
