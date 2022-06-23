// 'https://zena-api-dev.herokuapp.com/api/v1/customers/me?fields=saved'

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zena/model/subscriber_model.dart';

import 'indivsual_channel.dart/the_channel_content_catagory.dart';

class RemoteService extends ChangeNotifier {
  Future<String?> getUserNameData() async {
    var client = http.Client();
    var uri = Uri.parse('${url}v1/customers/me?fields=saved');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer ${token!}'});
    if (response.statusCode == 200) {
      var json = response.body;

      return subscriberDataFromJson(json).data!.doc!.name;
    }
    return null;
  }

  Future<String?> getUserEmailData() async {
    var client = http.Client();
    var uri = Uri.parse('${url}v1/customers/me?fields=saved');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer ${token!}'});
    print("Subscriber Data: " + response.body);
    if (response.statusCode == 200) {
      var json = response.body;

      return subscriberDataFromJson(json).data!.doc!.email;
    }
    return null;
  }
}
