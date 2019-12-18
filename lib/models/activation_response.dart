// To parse this JSON data, do
//
//     final activationResponse = activationResponseFromJson(jsonString);

import 'dart:convert';

ActivationResponse activationResponseFromJson(String str) => ActivationResponse.fromJson(json.decode(str));

String activationResponseToJson(ActivationResponse data) => json.encode(data.toJson());

class ActivationResponse {
  int playerId;
  String username;
  String name;
  String status;
  String message;

  ActivationResponse({
    this.playerId,
    this.username,
    this.name,
    this.status,
    this.message,
  });

  factory ActivationResponse.fromJson(Map<String, dynamic> json) => ActivationResponse(
    playerId: json["player_id"],
    username: json["username"],
    name: json["name"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "player_id": playerId,
    "username": username,
    "name": name,
    "status": status,
    "message": message,
  };
}
