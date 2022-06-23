import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/Screen/Channel&Account/ChannelPage.dart';
import 'package:zena/model/saved_data_model.dart';
import 'package:zena/module/DialogBox.dart';

import '../../provider/indi_account.dart/getSaved.dart';

class SavedContent extends StatefulWidget {
  const SavedContent({Key? key}) : super(key: key);

  @override
  State<SavedContent> createState() => _SavedContentState();
}

class _SavedContentState extends State<SavedContent> {
  List<Saved>? contentModels;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    contentModels = (await RemoteService().getSaved()) as List<Saved>;
    if (contentModels != null) {
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
          color: HexColor('#2E92EE'),
          size: 50.0,
        ),
      ),
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: contentModels?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ChannelPage(
                                      contentID: contentModels![index]
                                          .publisherChannel!
                                          .id!,
                                      imageURL: contentModels![index]
                                          .publisherChannel!
                                          .logo!,
                                      channelName: contentModels![index]
                                          .publisherChannel!
                                          .name!,
                                    )));
                      }),
                      child: CircleAvatar(
                        radius: 15.0,
                        onBackgroundImageError: (exception, stackTrace) =>
                            const Icon(Icons.error_outline),
                        backgroundColor: Theme.of(context).primaryColor,
                        backgroundImage: NetworkImage(
                            contentModels![index].publisherChannel!.logo!),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () => setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ChannelPage(
                                      contentID: contentModels![index]
                                          .publisherChannel!
                                          .id!,
                                      imageURL: contentModels![index]
                                          .publisherChannel!
                                          .logo!,
                                      channelName: contentModels![index]
                                          .publisherChannel!
                                          .name!,
                                    )));
                      }),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contentModels![index].publisherChannel!.name!,
                              // textAlign: TextAlign.start,
                              style: GoogleFonts.acme(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            contentModels![index].publishedDate.toString(),
                            style: GoogleFonts.acme(
                                // color: HexColor("#C0C0BE"),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 170.0),
                    // DialogBox(index: index, id: ChannelPage.id),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: 340.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          child: Image.network(
                            contentModels![index].poster!,
                            height: 150.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, obj, stacktrace) =>
                                const Icon(Icons.error_outline),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            contentModels![index].title!,
                            style: GoogleFonts.acme(
                              fontSize: 29.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            contentModels![index].description!,
                            style: GoogleFonts.acme(
                              fontSize: 16.0,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 15.0, top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                contentModels![index].viewCount!.toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("#C0C0BE"),
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              Icon(
                                Icons.remove_red_eye,
                                color: HexColor("#C0C0BE"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
              ],
            ),
          );
        },
      ),
    );
  }
}
