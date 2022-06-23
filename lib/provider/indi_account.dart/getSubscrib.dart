// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zena/model/subscried_data_model.dart';
import 'package:zena/provider/indivsual_channel.dart/the_channel_content_catagory.dart';
// 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyNzkxOGZmYzA1ODA1MmJlODYwMWUwYyIsImlhdCI6MTY1NTg5NzEyNSwiZXhwIjoxNjYzNjczMTI1fQ.VdPOvk0AqVZMd-qL5625O6515DdOYREHdEsxKrxOyk4'

class RemoteServiceChannel {
  Future<List<SubscribedTo>?> getSubscried() async {
    var client = http.Client();

    var uri = Uri.parse('${url}v1/customers/subscribed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer ${token!}'});
    if (response.statusCode == 200) {
      var json = response.body;
      return subscribeDataFromJson(json).data!.doc!.subscribedTo;
    }
    return null;
  }
}
