// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:zena/model/news_model.dart';
import '../indivsual_channel.dart/the_channel_Politics_content.dart';

class RemoteService extends ChangeNotifier {
  Future<List<News>?> getBusinessNewsContent() async {
    var client = http.Client();
    var uri = Uri.parse('${url}v1/news?category=business&');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      newsModelFromJson(json).data!.news!.forEach((News news) {});
      return newsModelFromJson(json).data!.news;
    }
    return null;
  }
}
