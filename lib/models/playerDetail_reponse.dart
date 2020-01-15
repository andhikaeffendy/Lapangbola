// To parse this JSON data, do
//
//     final playerDetailResponse = playerDetailResponseFromJson(jsonString);

import 'dart:convert';

PlayerDetailResponse playerDetailResponseFromJson(String str) => PlayerDetailResponse.fromJson(json.decode(str));

String playerDetailResponseToJson(PlayerDetailResponse data) => json.encode(data.toJson());

class PlayerDetailResponse {
  int id;
  String clubName;
  int clubId;
  int games;
  String national;
  dynamic height;
  double weight;
  String city;
  String playerName;
  String positionName;
  int totalStarting;
  int totalSub;
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
  int totalYellowCard;
  int totalRedCard;
  String status;
  String message;

  PlayerDetailResponse({
    this.id,
    this.clubName,
    this.clubId,
    this.games,
    this.national,
    this.height,
    this.weight,
    this.city,
    this.playerName,
    this.positionName,
    this.totalStarting,
    this.totalSub,
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
    this.totalYellowCard,
    this.totalRedCard,
    this.status,
    this.message,
  });

  factory PlayerDetailResponse.fromJson(Map<String, dynamic> json) => PlayerDetailResponse(
    id: json["id"],
    clubName: json["club_name"],
    clubId: json["club_id"],
    games: json["games"],
    national: json["national"],
    height: json["height"],
    weight: json["weight"],
    city: json["city"],
    playerName: json["player_name"],
    positionName: json["position_name"],
    totalStarting: json["total_starting"],
    totalSub: json["total_sub"],
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
    totalYellowCard: json["total_yellow_card"],
    totalRedCard: json["total_red_card"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "club_name": clubName,
    "club_id": clubId,
    "games": games,
    "national": national,
    "height": height,
    "weight": weight,
    "city": city,
    "player_name": playerName,
    "position_name": positionName,
    "total_starting": totalStarting,
    "total_sub": totalSub,
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
    "total_yellow_card": totalYellowCard,
    "total_red_card": totalRedCard,
    "status": status,
    "message": message,
  };
}
