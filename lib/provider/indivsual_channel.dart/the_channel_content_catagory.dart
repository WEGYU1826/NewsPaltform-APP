import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:zena/model/news_model.dart';

const String url = 'https://zena-api-dev.herokuapp.com/api/';
// const String url = '192.168.43.121:8080/api/';

class RemoteService extends ChangeNotifier {
  Future<List<News>?> getChannelNewsContentByIdPolitics(String id) async {
    var client = http.Client();
    var uri = Uri.parse(
        '${url}v1/news?category=politics&sort=-viewCount&publisherChannel=$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      newsModelFromJson(json).data!.news!.forEach((News news) {});
      return newsModelFromJson(json).data!.news;
    }
    return null;
  }

  Future<List<News>?> getChannelNewsContentByIdBusiness(String id) async {
    var client = http.Client();
    var uri = Uri.parse(
        '${url}v1/news?category=business&sort=-viewCount&publisherChannel=$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      newsModelFromJson(json).data!.news!.forEach((News news) {});
      return newsModelFromJson(json).data!.news;
    }
    return null;
  }

  Future<List<News>?> getChannelNewsContentByIdTechnology(String id) async {
    var client = http.Client();
    var uri = Uri.parse(
        '${url}v1/news?category=technology&sort=-viewCount&publisherChannel=$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      newsModelFromJson(json).data!.news!.forEach((News news) {});
      return newsModelFromJson(json).data!.news;
    }
    return null;
  }

  Future<List<News>?> getChannelNewsContentByIdHealth(String id) async {
    var client = http.Client();
    var uri = Uri.parse(
        '${url}v1/news?category=health&sort=-viewCount&publisherChannel=$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      newsModelFromJson(json).data!.news!.forEach((News news) {});
      return newsModelFromJson(json).data!.news;
    }
    return null;
  }

  Future<List<News>?> getChannelNewsContentByIdSport(String id) async {
    var client = http.Client();
    var uri = Uri.parse(
        '${url}v1/news?category=sport&sort=-viewCount&publisherChannel=$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      newsModelFromJson(json).data!.news!.forEach((News news) {});
      return newsModelFromJson(json).data!.news;
    }
    return null;
  }

  Future<List<News>?> getChannelNewsContentByIdEntertainment(String id) async {
    var client = http.Client();
    var uri = Uri.parse(
        '${url}v1/news?category=entertainment&sort=-viewCount&publisherChannel=$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      newsModelFromJson(json).data!.news!.forEach((News news) {});
      return newsModelFromJson(json).data!.news;
    }
    return null;
  }
}
