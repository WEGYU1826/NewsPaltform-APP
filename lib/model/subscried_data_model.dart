// To parse this JSON data, do
//
//     final subscribeData = subscribeDataFromJson(jsonString);

import 'dart:convert';

SubscribeData subscribeDataFromJson(String str) =>
    SubscribeData.fromJson(json.decode(str));

String subscribeDataToJson(SubscribeData data) => json.encode(data.toJson());

class SubscribeData {
  SubscribeData({
    this.status,
    this.data,
  });

  final String? status;
  final Data? data;

  factory SubscribeData.fromJson(Map<String, dynamic> json) => SubscribeData(
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
    this.subscribedTo,
    this.id,
    this.docId,
  });

  final List<SubscribedTo>? subscribedTo;
  final String? id;
  final String? docId;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        subscribedTo: List<SubscribedTo>.from(
            json["subscribedTo"].map((x) => SubscribedTo.fromJson(x))),
        id: json["_id"],
        docId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "subscribedTo":
            List<dynamic>.from(subscribedTo!.map((x) => x.toJson())),
        "_id": id,
        "id": docId,
      };
}

class SubscribedTo {
  SubscribedTo({
    this.id,
    this.name,
    this.logo,
    this.subscribedToId,
  });

  final String? id;
  final String? name;
  final String? logo;
  final String? subscribedToId;

  factory SubscribedTo.fromJson(Map<String, dynamic> json) => SubscribedTo(
        id: json["_id"],
        name: json["name"],
        logo: 'https://zena-api-dev.herokuapp.com/${json["logo"]}',
        subscribedToId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "logo": logo,
        "id": subscribedToId,
      };
}
