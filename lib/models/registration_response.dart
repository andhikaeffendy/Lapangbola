// To parse this JSON data, do
//
//     final registrationReponse = registrationReponseFromJson(jsonString);

import 'dart:convert';

RegistrationReponse registrationReponseFromJson(String str) => RegistrationReponse.fromJson(json.decode(str));

String registrationReponseToJson(RegistrationReponse data) => json.encode(data.toJson());

class RegistrationReponse {
  String phoneNumber;
  String email;
  String username;
  String name;
  int activeStatus;
  String status;
  String message;
  int playerId;

  RegistrationReponse({
    this.phoneNumber,
    this.email,
    this.username,
    this.name,
    this.activeStatus,
    this.status,
    this.message,
    this.playerId,
  });

  factory RegistrationReponse.fromJson(Map<String, dynamic> json) => RegistrationReponse(
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
