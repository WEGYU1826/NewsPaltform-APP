// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:zena/model/news_model.dart';

class RemoteService extends ChangeNotifier {
  Future<List<News>?> getNewsContent() async {
    var client = http.Client();

    var uri = Uri.parse('https://zena-api-dev.herokuapp.com/api/v1/news');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return newsModelFromJson(json).data!.news;
    }
  }
}
