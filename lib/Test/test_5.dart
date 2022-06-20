import 'package:flutter/material.dart';
import 'package:zena/model/channel_model.dart';
import 'package:zena/provider/ChanneContentl.dart';

class ProviderTestChannel extends StatefulWidget {
  const ProviderTestChannel({Key? key}) : super(key: key);
  static const String id = "Provid_Test";

  @override
  State<ProviderTestChannel> createState() => _ProviderTestState();
}

class _ProviderTestState extends State<ProviderTestChannel> {
  List<Doc>? channelModels;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    channelModels =
        (await RemoteServiceChannel().getChannelContent()) as List<Doc>;
    if (channelModels != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Test"),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: channelModels?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          channelModels![index].name!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          channelModels![index].subscriberCount!.toString(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Image.network(channelModels![index].logo!),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
