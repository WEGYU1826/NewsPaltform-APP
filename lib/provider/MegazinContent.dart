// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zena/model/channel_model.dart';

import 'indivsual_channel.dart/the_channel_content_catagory.dart';

class RemoteServiceChannel {
  Future<List<Doc>?> getMegazinChannelContent() async {
    var client = http.Client();

    var uri = Uri.parse('${url}v1/publisherChannels?newsType=magazine');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return channelModelFromJson(json).data!.doc;
    }
    return null;
  }
}
