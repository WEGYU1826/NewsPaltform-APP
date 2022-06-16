import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

// 'https://zena-api-dev.herokuapp.com/api/v1/customers/login'

class Login {
  Login({
    this.status,
    this.error,
    this.message,
    this.stack,
  });

  final String? status;
  final Error? error;
  final String? message;
  final String? stack;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        error: Error.fromJson(json["error"]),
        message: json["message"],
        stack: json["stack"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error!.toJson(),
        "message": message,
        "stack": stack,
      };
}

class Error {
  Error({
    this.statusCode,
    this.status,
    this.isOperational,
  });

  final int? statusCode;
  final String? status;
  final bool? isOperational;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        statusCode: json["statusCode"],
        status: json["status"],
        isOperational: json["isOperational"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "isOperational": isOperational,
      };
}
