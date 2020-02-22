// To parse this JSON data, do
//
//     final verifResponse = verifResponseFromJson(jsonString);

import 'dart:convert';

VerifResponse verifResponseFromJson(String str) => VerifResponse.fromJson(json.decode(str));

String verifResponseToJson(VerifResponse data) => json.encode(data.toJson());

class VerifResponse {
  String phoneNumber;
  String email;
  String username;
  String name;
  int activeStatus;
  String status;
  String message;
  int playerId;

  VerifResponse({
    this.phoneNumber,
    this.email,
    this.username,
    this.name,
    this.activeStatus,
    this.status,
    this.message,
    this.playerId,
  });

  factory VerifResponse.fromJson(Map<String, dynamic> json) => VerifResponse(
    phoneNumber: json["phone_number"],
    email: json["email"],
    username: json["username"],
    name: json["name"],
    activeStatus: json["active_status"],
    status: json["status"],
    message: json["message"],
    playerId: json["player_id"],
  );

  Map<String, dynamic> toJson() => {
    "phone_number": phoneNumber,
    "email": email,
    "username": username,
    "name": name,
    "active_status": activeStatus,
    "status": status,
    "message": message,
    "player_id": playerId,
  };
}
