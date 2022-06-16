import 'dart:convert';

GetCurrentCustomer getCurrentCustomerFromJson(String str) =>
    GetCurrentCustomer.fromJson(json.decode(str));

String getCurrentCustomerToJson(GetCurrentCustomer data) =>
    json.encode(data.toJson());

// 'https://zena-api-dev.herokuapp.com/api/v1/customers/me'

class GetCurrentCustomer {
  GetCurrentCustomer({
    this.status,
    this.error,
    this.message,
    this.stack,
  });

  final String? status;
  final Error? error;
  final String? message;
  final String? stack;

  factory GetCurrentCustomer.fromJson(Map<String, dynamic> json) =>
      GetCurrentCustomer(
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
