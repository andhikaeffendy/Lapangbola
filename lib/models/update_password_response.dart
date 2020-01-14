// To parse this JSON data, do
//
//     final updatePasswordResponse = updatePasswordResponseFromJson(jsonString);

import 'dart:convert';

UpdatePasswordResponse updatePasswordResponseFromJson(String str) => UpdatePasswordResponse.fromJson(json.decode(str));

String updatePasswordResponseToJson(UpdatePasswordResponse data) => json.encode(data.toJson());

class UpdatePasswordResponse {
  String status;
  String message;

  UpdatePasswordResponse({
    this.status,
    this.message,
  });

  factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) => UpdatePasswordResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
