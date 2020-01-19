// To parse this JSON data, do
//
//     final playerMatchDetailResponse = playerMatchDetailResponseFromJson(jsonString);

import 'dart:convert';

PlayerMatchDetailResponse playerMatchDetailResponseFromJson(String str) => PlayerMatchDetailResponse.fromJson(json.decode(str));

String playerMatchDetailResponseToJson(PlayerMatchDetailResponse data) => json.encode(data.toJson());

class PlayerMatchDetailResponse {
  int id;
  String homeClubName;
  String awayClubName;
  int homeScore;
  int awayScore;
  String playerName;
  String clubName;
  String positionName;
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
  String status;
  String message;

  PlayerMatchDetailResponse({
    this.id,
    this.homeClubName,
    this.awayClubName,
    this.homeScore,
    this.awayScore,
    this.playerName,
    this.clubName,
    this.positionName,
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
    this.status,
    this.message,
  });

  factory PlayerMatchDetailResponse.fromJson(Map<String, dynamic> json) => PlayerMatchDetailResponse(
    id: json["id"],
    homeClubName: json["home_club_name"],
    awayClubName: json["away_club_name"],
    homeScore: json["home_score"],
    awayScore: json["away_score"],
    playerName: json["player_name"],
    clubName: json["club_name"],
    positionName: json["position_name"],
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
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "home_club_name": homeClubName,
    "away_club_name": awayClubName,
    "home_score": homeScore,
    "away_score": awayScore,
    "player_name": playerName,
    "club_name": clubName,
    "position_name": positionName,
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
    "status": status,
    "message": message,
  };
}
