// ignore_for_file: file_names

import 'dart:convert';

GetPublishedChannelById getPublishedChannelByIdFromJson(String str) =>
    GetPublishedChannelById.fromJson(json.decode(str));

String getPublishedChannelByIdToJson(GetPublishedChannelById data) =>
    json.encode(data.toJson());

class GetPublishedChannelById {
  GetPublishedChannelById({
    this.status,
    this.data,
  });

  final String? status;
  final Data? data;

  factory GetPublishedChannelById.fromJson(Map<String, dynamic> json) =>
      GetPublishedChannelById(
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
    this.v,
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
  final String? city;
  final String? phoneNumber;
  final String? webpage;
  final String? priceType;
  final String? newsType;
  final String? slug;
  final int? v;
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
        city: json["city"],
        phoneNumber: json["phoneNumber"],
        webpage: json["webpage"],
        priceType: json["priceType"],
        newsType: json["newsType"],
        slug: json["slug"],
        v: json["__v"],
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
        "city": city,
        "phoneNumber": phoneNumber,
        "webpage": webpage,
        "priceType": priceType,
        "newsType": newsType,
        "slug": slug,
        "__v": v,
        "publishedContentCount": publishedContentCount,
        "subscriberCount": subscriberCount,
        "id": docId,
      };
}
