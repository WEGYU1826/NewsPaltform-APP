// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zena/model/channel_model.dart';

class RemoteServiceChannel {
  Future<List<Doc>?> getChannelContentByID(String id) async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://zena-api-dev.herokuapp.com/api/v1/publisherChannels/id/$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return channelModelFromJson(json).data!.doc;
    }
    return null;
  }
}
