// To parse this JSON data, do
//
//     final subscriberData = subscriberDataFromJson(jsonString);

import 'dart:convert';

SubscriberData subscriberDataFromJson(String str) =>
    SubscriberData.fromJson(json.decode(str));

String subscriberDataToJson(SubscriberData data) => json.encode(data.toJson());

class SubscriberData {
  SubscriberData({
    this.status,
    this.data,
  });

  final String? status;
  final Data? data;

  factory SubscriberData.fromJson(Map<String, dynamic> json) => SubscriberData(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.doc,
  });

  final Doc? doc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        doc: Doc.fromJson(json["doc"]),
      );

  Map<String, dynamic> toJson() => {
        "doc": doc!.toJson(),
      };
}

class Doc {
  Doc({
    this.type,
    this.createdAt,
    this.subscribedTo,
    this.saved,
    this.recent,
    this.preferences,
    this.txRef,
    this.loggedInDevises,
    this.viewCount,
    this.subscriptionCount,
    this.downloadCount,
    this.active,
    this.id,
    this.v,
    this.email,
    this.name,
    this.password,
    this.firstName,
    this.lastName,
    this.docId,
  });

  final String? type;
  final DateTime? createdAt;
  final List<String>? subscribedTo;
  final List<String>? saved;
  final List<String>? recent;
  final List<String>? preferences;
  final List<dynamic>? txRef;
  final List<dynamic>? loggedInDevises;
  final int? viewCount;
  final int? subscriptionCount;
  final int? downloadCount;
  final bool? active;
  final String? id;
  final int? v;
  final String? email;
  final String? name;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? docId;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        type: json["type"],
        createdAt: DateTime.parse(json["createdAt"]),
        subscribedTo: List<String>.from(json["subscribedTo"].map((x) => x)),
        saved: List<String>.from(json["saved"].map((x) => x)),
        recent: List<String>.from(json["recent"].map((x) => x)),
        preferences: List<String>.from(json["preferences"].map((x) => x)),
        txRef: List<dynamic>.from(json["txRef"].map((x) => x)),
        loggedInDevises:
            List<dynamic>.from(json["loggedInDevises"].map((x) => x)),
        viewCount: json["viewCount"],
        subscriptionCount: json["subscriptionCount"],
        downloadCount: json["downloadCount"],
        active: json["active"],
        id: json["_id"],
        v: json["__v"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        docId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "createdAt": createdAt!.toIso8601String(),
        "subscribedTo": List<dynamic>.from(subscribedTo!.map((x) => x)),
        "saved": List<dynamic>.from(saved!.map((x) => x)),
        "recent": List<dynamic>.from(recent!.map((x) => x)),
        "preferences": List<dynamic>.from(preferences!.map((x) => x)),
        "txRef": List<dynamic>.from(txRef!.map((x) => x)),
        "loggedInDevises": List<dynamic>.from(loggedInDevises!.map((x) => x)),
        "viewCount": viewCount,
        "subscriptionCount": subscriptionCount,
        "downloadCount": downloadCount,
        "active": active,
        "_id": id,
        "__v": v,
        "email": email,
        "name": name,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "id": docId,
      };
}
