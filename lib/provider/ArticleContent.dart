// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zena/model/channel_model.dart';
import 'indivsual_channel.dart/the_channel_content_catagory.dart';
import 'package:scoped_model/scoped_model.dart';

class RemoteServiceChannel {
  bool _loadingUser = false;
  Future<List<Doc>?> getArticleChannelContent() async {
    var client = http.Client();

    try {
      var uri = Uri.parse('${url}v1/publisherChannels?newsType=article');
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        return channelModelFromJson(json).data!.doc;
      }
      _loadingUser = false;

      return null;
    } on Exception catch (e) {
      print(e);
      _loadingUser = false;
    }
  }
}
