// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String status;
  int playerId;
  String username;
  String token;
  String name;
  String phoneNumber;
  String email;
  String photoUrl;
  String message;

  LoginResponse({
    this.status,
    this.playerId,
    this.username,
    this.token,
    this.name,
    this.phoneNumber,
    this.email,
    this.photoUrl,
    this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    playerId: json["player_id"],
    username: json["username"],
    token: json["token"],
    name: json["name"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    photoUrl: json["photo_url"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "player_id": playerId,
    "username": username,
    "token": token,
    "name": name,
    "phone_number": phoneNumber,
    "email": email,
    "photo_url": photoUrl,
    "message": message,
  };
}
