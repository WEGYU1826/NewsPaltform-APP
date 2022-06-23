// To parse this JSON data, do
//
//     final savedData = savedDataFromJson(jsonString);

import 'dart:convert';

SavedData savedDataFromJson(String str) => SavedData.fromJson(json.decode(str));

String savedDataToJson(SavedData data) => json.encode(data.toJson());

class SavedData {
  SavedData({
    this.status,
    this.data,
  });

  final String? status;
  final Data? data;

  factory SavedData.fromJson(Map<String, dynamic> json) => SavedData(
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
    this.saved,
    this.id,
    this.docId,
  });

  final List<Saved>? saved;
  final String? id;
  final String? docId;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        saved: List<Saved>.from(json["saved"].map((x) => Saved.fromJson(x))),
        id: json["_id"],
        docId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "saved": List<dynamic>.from(saved!.map((x) => x.toJson())),
        "_id": id,
        "id": docId,
      };
}

class Saved {
  Saved({
    this.publishedDate,
    this.viewCount,
    this.id,
    this.title,
    this.description,
    this.newsType,
    this.content,
    this.publisherChannel,
    this.poster,
    this.savedId,
    this.size,
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
  final String? savedId;
  final String? size;

  factory Saved.fromJson(Map<String, dynamic> json) => Saved(
        publishedDate: DateTime.parse(json["publishedDate"]),
        viewCount: json["viewCount"],
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        newsType: json["newsType"],
        content: json["content"],
        publisherChannel: PublisherChannel.fromJson(json["publisherChannel"]),
        poster: 'https://zena-api-dev.herokuapp.com/${json["poster"]}',
        savedId: json["id"],
        size: json["size"] == null ? null : json["size"],
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
        "id": savedId,
        "size": size == null ? null : size,
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
