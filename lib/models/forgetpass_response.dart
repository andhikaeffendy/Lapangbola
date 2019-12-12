// To parse this JSON data, do
//
//     final forgetpassReponse = forgetpassReponseFromJson(jsonString);

import 'dart:convert';

ForgetpassReponse forgetpassReponseFromJson(String str) => ForgetpassReponse.fromJson(json.decode(str));

String forgetpassReponseToJson(ForgetpassReponse data) => json.encode(data.toJson());

class ForgetpassReponse {
  String phoneNumber;
  String status;
  String message;
  int userId;

  ForgetpassReponse({
    this.phoneNumber,
    this.status,
    this.message,
    this.userId,
  });

  factory ForgetpassReponse.fromJson(Map<String, dynamic> json) => ForgetpassReponse(
    phoneNumber: json["phone_number"],
    status: json["status"],
    message: json["message"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "phone_number": phoneNumber,
    "status": status,
    "message": message,
    "user_id": userId,
  };
}