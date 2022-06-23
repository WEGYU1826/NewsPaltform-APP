// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zena/model/rescent_data.dart';
import 'package:zena/model/saved_data_model.dart';
import '../indivsual_channel.dart/the_channel_content_catagory.dart';

class RemoteService extends ChangeNotifier {
  Future<List<Recent>?> getRescent() async {
    var client = http.Client();
    var uri = Uri.parse('${url}v1/customers/recent');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer ${token!}'});
    if (response.statusCode == 200) {
      var json = response.body;
      return rescentDataFromJson(json).data!.doc!.recent;
    }
    return null;
  }
}
