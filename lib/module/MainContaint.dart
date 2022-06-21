// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/Screen/Channel&Account/ChannelPage.dart';
import 'package:zena/module/BuildDialogBox.dart';
import 'package:zena/module/DialogBox.dart';

import '../model/news_model.dart';
import '../provider/NewsContent.dart';

// ignore: must_be_immutable
class MainContent extends StatefulWidget {
  MainContent({Key? key}) : super(key: key);
  static const String id = "main_containt";

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
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
    return buildContent(context);
  }

  Widget buildContent(context) => SliverToBoxAdapter(
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
            primary: false,
            shrinkWrap: true,
            itemCount: newsModels?.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          Navigator.pushNamed(context, ChannelPage.id);
                        }),
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Theme.of(context).primaryColor,
                          backgroundImage: NetworkImage(
                              newsModels![index].publisherChannel!.logo!),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () => setState(() {
                          Navigator.pushNamed(context, ChannelPage.id);
                        }),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(newsModels![index].publisherChannel!.name!,
                                // textAlign: TextAlign.start,
                                style: GoogleFonts.acme(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              newsModels![index].publishedDate.toString(),
                              style: GoogleFonts.acme(
                                  // color: HexColor("#C0C0BE"),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 170.0),
                      DialogBox(index: index, id: ChannelPage.id),
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
                              newsModels![index].poster!,
                              height: 150.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              newsModels![index].title!,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              newsModels![index].description!,
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
                                  newsModels![index].viewCount!.toString(),
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
                ],
              ),
            ),
          ),
        ),
      );
}
