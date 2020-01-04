// To parse this JSON data, do
//
//     final clubResponse = clubResponseFromJson(jsonString);

import 'dart:convert';

ClubResponse clubResponseFromJson(String str) => ClubResponse.fromJson(json.decode(str));

String clubResponseToJson(ClubResponse data) => json.encode(data.toJson());

class ClubResponse {
  int id;
  String clubName;
  int games;
  String city;
  int totalGoal;
  int totalShootOffTarget;
  int totalShootOnTarget;
  int totalIntercept;
  int totalClearance;
  int totalSave;
  int totalFoul;
  int totalTackle;
  int totalAssist;
  int totalDribbleSuccess;
  int totalBlockCross;
  int totalPassing;
  String status;
  String message;

  ClubResponse({
    this.id,
    this.clubName,
    this.games,
    this.city,
    this.totalGoal,
    this.totalShootOffTarget,
    this.totalShootOnTarget,
    this.totalIntercept,
    this.totalClearance,
    this.totalSave,
    this.totalFoul,
    this.totalTackle,
    this.totalAssist,
    this.totalDribbleSuccess,
    this.totalBlockCross,
    this.totalPassing,
    this.status,
    this.message,
  });

  factory ClubResponse.fromJson(Map<String, dynamic> json) => ClubResponse(
    id: json["id"],
    clubName: json["club_name"],
    games: json["games"],
    city: json["city"],
    totalGoal: json["total_goal"],
    totalShootOffTarget: json["total_shoot_off_target"],
    totalShootOnTarget: json["total_shoot_on_target"],
    totalIntercept: json["total_intercept"],
    totalClearance: json["total_clearance"],
    totalSave: json["total_save"],
    totalFoul: json["total_foul"],
    totalTackle: json["total_tackle"],
    totalAssist: json["total_assist"],
    totalDribbleSuccess: json["total_dribble_success"],
    totalBlockCross: json["total_block_cross"],
    totalPassing: json["total_passing"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "club_name": clubName,
    "games": games,
    "city": city,
    "total_goal": totalGoal,
    "total_shoot_off_target": totalShootOffTarget,
    "total_shoot_on_target": totalShootOnTarget,
    "total_intercept": totalIntercept,
    "total_clearance": totalClearance,
    "total_save": totalSave,
    "total_foul": totalFoul,
    "total_tackle": totalTackle,
    "total_assist": totalAssist,
    "total_dribble_success": totalDribbleSuccess,
    "total_block_cross": totalBlockCross,
    "total_passing": totalPassing,
    "status": status,
    "message": message,
  };
}
