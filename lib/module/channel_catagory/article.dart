import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Screen/Channel&Account/ChannelPage.dart';
import '../../model/channel_model.dart';
import '../../provider/ArticleContent.dart';

class ArticleChannelCatagories extends StatefulWidget {
  const ArticleChannelCatagories({Key? key}) : super(key: key);

  @override
  State<ArticleChannelCatagories> createState() =>
      _ArticleChannelCatagoriesState();
}

class _ArticleChannelCatagoriesState extends State<ArticleChannelCatagories> {
  List<Doc>? channelModels;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    channelModels =
        (await RemoteServiceChannel().getArticleChannelContent()) as List<Doc>;
    if (channelModels != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: Center(
        child: SpinKitDualRing(
          color: HexColor('##2E92EE'),
          size: 50.0,
        ),
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        primary: false,
        shrinkWrap: true,
        itemCount: channelModels?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChannelPage(
                              contentID: channelModels![index].id,
                              imageURL: channelModels![index].logo,
                              channelName: channelModels![index].name,
                            )));
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).accentColor,
                            offset: const Offset(0, 3),
                            spreadRadius: 5.0,
                            blurRadius: 7.0,
                          ),
                        ],
                        // color: Theme.of(context).accentColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: Image.network(
                          channelModels![index].logo!,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                          errorBuilder: (context, obj, stacktrace) =>
                              const Icon(Icons.error_outline),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    channelModels![index].name!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.acme(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
