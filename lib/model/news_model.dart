import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.status,
    this.results,
    this.data,
  });

  final String? status;
  final int? results;
  final Data? data;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
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
    this.news,
  });

  final List<News>? news;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "news": List<dynamic>.from(news!.map((x) => x.toJson())),
      };
}

class News {
  News({
    this.publishedDate,
    this.authors,
    this.viewCount,
    this.priceType,
    this.category,
    this.keyWords,
    this.id,
    this.title,
    this.description,
    this.newsType,
    this.content,
    this.publisherChannel,
    this.locationType,
    this.poster,
    this.slug,
    this.newsId,
    this.size,
  });

  final DateTime? publishedDate;
  final List<Author>? authors;
  final int? viewCount;
  final PriceType? priceType;
  final List<String>? category;
  final List<KeyWord>? keyWords;
  final String? id;
  final String? title;
  final String? description;
  final NewsType? newsType;
  final String? content;
  final PublisherChannel? publisherChannel;
  final LocationType? locationType;
  final String? poster;
  final String? slug;
  final String? newsId;
  final String? size;

  factory News.fromJson(Map<String, dynamic> json) => News(
        publishedDate: DateTime.parse(json["publishedDate"]),
        authors:
            List<Author>.from(json["authors"].map((x) => authorValues.map![x])),
        viewCount: json["viewCount"],
        priceType: priceTypeValues.map![json["priceType"]],
        category: List<String>.from(json["category"].map((x) => x)),
        keyWords: List<KeyWord>.from(
            json["keyWords"].map((x) => keyWordValues.map![x])),
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        newsType: newsTypeValues.map![json["newsType"]],
        content: json["content"],
        publisherChannel: json["publisherChannel"] == null
            ? null
            : PublisherChannel.fromJson(json["publisherChannel"]),
        locationType: locationTypeValues.map![json["locationType"]],
        poster: 'https://zena-api-dev.herokuapp.com/${json["poster"]}',
        slug: json["slug"],
        newsId: json["id"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "publishedDate": publishedDate!.toIso8601String(),
        "authors":
            List<dynamic>.from(authors!.map((x) => authorValues.reverse![x])),
        "viewCount": viewCount,
        "priceType": priceTypeValues.reverse![priceType],
        "category": List<dynamic>.from(category!.map((x) => x)),
        "keyWords":
            List<dynamic>.from(keyWords!.map((x) => keyWordValues.reverse![x])),
        "_id": id,
        "title": title,
        "description": description,
        "newsType": newsTypeValues.reverse![newsType],
        "content": content,
        "publisherChannel":
            publisherChannel == null ? null : publisherChannel!.toJson(),
        "locationType": locationTypeValues.reverse![locationType],
        "poster": poster,
        "slug": slug,
        "id": newsId,
        "size": size,
      };
}

enum Author { SURAFEL_TAMIRU, BETTY_MELESE }

final authorValues = EnumValues({
  "Betty Melese": Author.BETTY_MELESE,
  "Surafel Tamiru": Author.SURAFEL_TAMIRU
});

enum KeyWord { KEY_WORD_B2, KEY_WORD_B3, KEY_WORD_C4, KEY_WORD_C5 }

final keyWordValues = EnumValues({
  "keyWordB2": KeyWord.KEY_WORD_B2,
  "keyWordB3": KeyWord.KEY_WORD_B3,
  "keyWordC4": KeyWord.KEY_WORD_C4,
  "keyWordC5": KeyWord.KEY_WORD_C5
});

enum LocationType { local }

final locationTypeValues = EnumValues({"local": LocationType.local});

enum NewsType {
  magazine,
  article,
}

final newsTypeValues =
    EnumValues({"article": NewsType.article, "magazine": NewsType.magazine});

enum PriceType { free }

final priceTypeValues = EnumValues({"free": PriceType.free});

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
  final PriceType? priceType;
  final String? publisherChannelId;

  factory PublisherChannel.fromJson(Map<String, dynamic> json) =>
      PublisherChannel(
        id: json["_id"],
        name: json["name"],
        logo: 'https://zena-api-dev.herokuapp.com/${json["logo"]}',
        priceType: priceTypeValues.map![json["priceType"]],
        publisherChannelId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "logo": logo,
        "priceType": priceTypeValues.reverse![priceType],
        "id": publisherChannelId,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}
