import 'dart:convert';

SubscriberData subscriberDataFromJson(String str) =>
    SubscriberData.fromJson(json.decode(str));

String subscriberDataToJson(SubscriberData data) => json.encode(data.toJson());

class SubscriberData {
  SubscriberData({
    this.status,
    this.token,
    this.data,
  });

  final String? status;
  final String? token;
  final Data? data;

  factory SubscriberData.fromJson(Map<String, dynamic> json) => SubscriberData(
        status: json["status"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.user,
  });

  final User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.token,
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
    this.firstName,
    this.lastName,
    this.docId,
  });
  final String? token;
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
  final String? firstName;
  final String? lastName;
  final String? docId;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
        "firstName": firstName,
        "lastName": lastName,
        "id": docId,
      };
}
