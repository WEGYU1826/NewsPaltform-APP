// ignore_for_file: file_names

import 'dart:convert';

ChannelModel channelModelFromJson(String str) =>
    ChannelModel.fromJson(json.decode(str));

String channelModelToJson(ChannelModel data) => json.encode(data.toJson());

class ChannelModel {
  ChannelModel({
    this.status,
    this.results,
    this.data,
  });

  final String? status;
  final int? results;
  final Data? data;

  factory ChannelModel.fromJson(Map<String, dynamic> json) => ChannelModel(
        status: json["status"],
        results: json["results"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.doc,
  });

  final List<Doc>? doc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        doc: List<Doc>.from(json["doc"].map((x) => Doc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "doc": List<dynamic>.from(doc!.map((x) => x.toJson())),
      };
}

class Doc {
  Doc({
    this.createdDate,
    this.category,
    this.earnings,
    this.active,
    this.id,
    this.name,
    this.email,
    this.description,
    this.logo,
    this.address,
    this.city,
    this.phoneNumber,
    this.webpage,
    this.priceType,
    this.newsType,
    this.slug,
    this.publishedContentCount,
    this.subscriberCount,
    this.docId,
  });

  final DateTime? createdDate;
  final List<String>? category;
  final int? earnings;
  final bool? active;
  final String? id;
  final String? name;
  final String? email;
  final String? description;
  final String? logo;
  final String? address;
  final City? city;
  final String? phoneNumber;
  final String? webpage;
  final PriceType? priceType;
  final NewsType? newsType;
  final String? slug;
  final int? publishedContentCount;
  final int? subscriberCount;
  final String? docId;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        createdDate: DateTime.parse(json["createdDate"]),
        category: List<String>.from(json["category"].map((x) => x)),
        earnings: json["earnings"],
        active: json["active"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        description: json["description"],
        logo: json["logo"],
        address: json["address"],
        city: cityValues.map![json["city"]],
        phoneNumber: json["phoneNumber"],
        webpage: json["webpage"],
        priceType: priceTypeValues.map![json["priceType"]],
        newsType: newsTypeValues.map![json["newsType"]],
        slug: json["slug"],
        publishedContentCount: json["publishedContentCount"],
        subscriberCount: json["subscriberCount"],
        docId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdDate": createdDate!.toIso8601String(),
        "category": List<dynamic>.from(category!.map((x) => x)),
        "earnings": earnings,
        "active": active,
        "_id": id,
        "name": name,
        "email": email,
        "description": description,
        "logo": logo,
        "address": address,
        "city": cityValues.reverse![city],
        "phoneNumber": phoneNumber,
        "webpage": webpage,
        "priceType": priceTypeValues.reverse![priceType],
        "newsType": newsTypeValues.reverse![newsType],
        "slug": slug,
        "publishedContentCount": publishedContentCount,
        "subscriberCount": subscriberCount,
        "id": docId,
      };
}

enum City { ADDIS_ABABA }

final cityValues = EnumValues({"Addis Ababa": City.ADDIS_ABABA});

enum NewsType { ARTICLE, MAGAZINE, NEWSPAPER }

final newsTypeValues = EnumValues({
  "article": NewsType.ARTICLE,
  "magazine": NewsType.MAGAZINE,
  "newspaper": NewsType.NEWSPAPER
});

enum PriceType { FREE }

final priceTypeValues = EnumValues({"free": PriceType.FREE});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
