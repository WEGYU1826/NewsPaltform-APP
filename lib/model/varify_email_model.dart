// ignore_for_file: file_names

import 'dart:convert';

VarifyEmailForSignUp varifyEmailForSignUpFromJson(String str) =>
    VarifyEmailForSignUp.fromJson(json.decode(str));

String varifyEmailForSignUpToJson(VarifyEmailForSignUp data) =>
    json.encode(data.toJson());

// 'https://zena-api-dev.herokuapp.com/api/v1/customers/verifyEmail'

class VarifyEmailForSignUp {
  VarifyEmailForSignUp({
    this.status,
    this.message,
  });

  final String? status;
  final String? message;

  factory VarifyEmailForSignUp.fromJson(Map<String, dynamic> json) =>
      VarifyEmailForSignUp(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
