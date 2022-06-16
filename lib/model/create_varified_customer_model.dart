import 'dart:convert';

CreateVarifyCustomer createVarifyCustomerFromJson(String str) =>
    CreateVarifyCustomer.fromJson(json.decode(str));

String createVarifyCustomerToJson(CreateVarifyCustomer data) =>
    json.encode(data.toJson());

// 'https://zena-api-dev.herokuapp.com/api/v1/customers/signup/eyJhbGciOiJIUzI1NiIsInR5cCaI6IkpXVCJ9.eyJuYW1lIjoiZTkyOGU4ZmEyNWE4MGI2MTk1ZmQ1N2I0YmZhMzBiMzE4NmQ1MWQ4YjIxY2VkY2ZkY2NjYzgwNjRjMjZhZjg4OTgxMzViM2QzOGNmMWNjODk1MDNjY2ZhYmQ3MGJmOWFjNDE4OWU0ODY4NTQ1OGNiY2I2MmU2ZDc5ZWU4MzU2NjAyMGQ5Zjc0YzBlNmZmYWNlYmFjZjhhYTNhNDdmMDk0OWQ5ZmJmZTY3ZjFmOWFhZjIwNDhmZmUzNGQ2N2E5YzE0MzdhNTA1MWU0M2ExIiwiZW1haWwiOiIxZmZjMTc5MWRlZGJmZDQzZDE2YjE1MTM2MjFhYTg1MDFmMDk2M2MwOTc0N2JkNzE0MjUxYmEyZDIzOTNjMzVjYWVmMzc4MmVkNjAyYjdhNzk0ODA1MWE0MTg0ZWFiODkxMjRjYzVkZWE1ZThiNTYwZmY4NjMzYjQ4NmYzNmVlMmIyN2ZlNTAzNWRiMDI2YTk3MjhlMWI0MDY3YWM4Yjc4ZDI4YzNhZTY2NjFjM2NiM2RkNmJhN2YzYmM2YjhmMmEzZDY4YTBjNjRiNDJmMjQ5MzIxNzE3NGM2ZDUzM2IiLCJwYXNzd29yZCI6IjBmMDg5OWM0ZTQ5NmE3Y2RhMTQ1ZmQwODc1MzlmYTM0MzU5MDA4NTAyNDhkMTViZGIyYmYzZGYxMjA3YzRlNjIyZjdjOGJmNzAwZWY1YjZkOTkxNTliYjdmNmNkNTdlMTBjNjU5NTRkMmRmN2U4MzQ0MjhjYmUzZWJhMjgwY2ZlZWVhOTNmYTFiODI2NjRjM2UzMzNmYzJmMjJkMGI2ZDI5ZTBlMTg0NDljODRiMGYxMTYzOTQ3MDhmN2M3M2QyNTRkZTIzYWU4MDIwYjM0N2FhOCIsImlhdCI6MTY1MDQzNTAxMywiZXhwIjoxNjUwNDM2ODEzfQ.2Fuh-Aqy0FLtRkgZeVwbA4Gf8Ke98C-rQZT6B1IwARU'

class CreateVarifyCustomer {
  CreateVarifyCustomer({
    this.status,
    this.error,
    this.message,
    this.stack,
  });

  final String? status;
  final Error? error;
  final String? message;
  final String? stack;

  factory CreateVarifyCustomer.fromJson(Map<String, dynamic> json) =>
      CreateVarifyCustomer(
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
    this.name,
    this.message,
    this.statusCode,
    this.status,
  });

  final String? name;
  final String? message;
  final int? statusCode;
  final String? status;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        name: json["name"],
        message: json["message"],
        statusCode: json["statusCode"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
        "statusCode": statusCode,
        "status": status,
      };
}
