// To parse this JSON data, do
//
//     final playerDetailReponse = playerDetailReponseFromJson(jsonString);

import 'dart:convert';

PlayerDetailReponse playerDetailReponseFromJson(String str) => PlayerDetailReponse.fromJson(json.decode(str));

String playerDetailReponseToJson(PlayerDetailReponse data) => json.encode(data.toJson());

class PlayerDetailReponse {
  int id;
  String clubName;
  int clubId;
  int games;
  String city;
  String playerName;
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

  PlayerDetailReponse({
    this.id,
    this.clubName,
    this.clubId,
    this.games,
    this.city,
    this.playerName,
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

  factory PlayerDetailReponse.fromJson(Map<String, dynamic> json) => PlayerDetailReponse(
    id: json["id"],
    clubName: json["club_name"],
    clubId: json["club_id"],
    games: json["games"],
    city: json["city"],
    playerName: json["player_name"],
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
    "club_name": clubName,
    "club_id": clubId,
    "games": games,
    "city": city,
    "player_name": playerName,
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
