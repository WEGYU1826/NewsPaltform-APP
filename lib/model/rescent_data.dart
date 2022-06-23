// To parse this JSON data, do
//
//     final rescentData = rescentDataFromJson(jsonString);

import 'dart:convert';

RescentData rescentDataFromJson(String str) =>
    RescentData.fromJson(json.decode(str));

String rescentDataToJson(RescentData data) => json.encode(data.toJson());

class RescentData {
  RescentData({
    this.status,
    this.data,
  });

  final String? status;
  final Data? data;

  factory RescentData.fromJson(Map<String, dynamic> json) => RescentData(
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
    this.recent,
    this.id,
    this.docId,
  });

  final List<Recent>? recent;
  final String? id;
  final String? docId;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        recent:
            List<Recent>.from(json["recent"].map((x) => Recent.fromJson(x))),
        id: json["_id"],
        docId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "recent": List<dynamic>.from(recent!.map((x) => x.toJson())),
        "_id": id,
        "id": docId,
      };
}

class Recent {
  Recent({
    this.publishedDate,
    this.viewCount,
    this.id,
    this.title,
    this.description,
    this.newsType,
    this.content,
    this.publisherChannel,
    this.poster,
    this.recentId,
  });

  final DateTime? publishedDate;
  final int? viewCount;
  final String? id;
  final String? title;
  final String? description;
  final String? newsType;
  final String? content;
  final PublisherChannel? publisherChannel;
  final String? poster;
  final String? recentId;

  factory Recent.fromJson(Map<String, dynamic> json) => Recent(
        publishedDate: DateTime.parse(json["publishedDate"]),
        viewCount: json["viewCount"],
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        newsType: json["newsType"],
        content: json["content"],
        publisherChannel: PublisherChannel.fromJson(json["publisherChannel"]),
        poster: 'https://zena-api-dev.herokuapp.com/${json["poster"]}',
        recentId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "publishedDate": publishedDate!.toIso8601String(),
        "viewCount": viewCount,
        "_id": id,
        "title": title,
        "description": description,
        "newsType": newsType,
        "content": content,
        "publisherChannel": publisherChannel!.toJson(),
        "poster": poster,
        "id": recentId,
      };
}

class PublisherChannel {
  PublisherChannel({
    this.id,
    this.name,
    this.logo,
    this.priceType,
    this.publisherChannelId,
  });

  final String? id;
  final String? name;
  final String? logo;
  final String? priceType;
  final String? publisherChannelId;

  factory PublisherChannel.fromJson(Map<String, dynamic> json) =>
      PublisherChannel(
        id: json["_id"],
        name: json["name"],
        logo: 'https://zena-api-dev.herokuapp.com/${json["logo"]}',
        priceType: json["priceType"],
        publisherChannelId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "logo": logo,
        "priceType": priceType,
        "id": publisherChannelId,
      };
}
