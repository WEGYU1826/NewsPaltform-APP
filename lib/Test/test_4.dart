import 'package:flutter/material.dart';
import 'package:zena/model/news_model.dart';
import 'package:zena/provider/NewsContent.dart';

class ProviderTest extends StatefulWidget {
  const ProviderTest({Key? key}) : super(key: key);
  static const String id = "Provider_Test";

  @override
  State<ProviderTest> createState() => _ProviderTestState();
}

class _ProviderTestState extends State<ProviderTest> {
  List<News>? newsModels;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    newsModels = (await RemoteService().getNewsContent()) as List<News>;
    if (newsModels != null) {
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
          itemCount: newsModels?.length,
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
                          newsModels![index].title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          newsModels![index].description ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
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
