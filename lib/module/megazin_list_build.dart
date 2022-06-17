import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/Screen/Channel&Account/MegazinPage.dart';
import 'package:zena/model/news_model.dart';
import 'package:zena/module/MainContaint.dart';
import 'package:zena/provider/NewsContent.dart';

import 'BuildDialogBox.dart';
import 'DialogBox.dart';

class MegazinListBuild extends StatefulWidget {
  MegazinListBuild({
    Key? key,
  }) : super(key: key);
  static const String id = "megazin_list_build";

  @override
  State<MegazinListBuild> createState() => _MegazinListBuildState();
}

class _MegazinListBuildState extends State<MegazinListBuild> {
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
    return SliverToBoxAdapter(
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
            // ignore: unrelated_type_equality_checks
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
                              Navigator.pushNamed(context, MegazinPage.id);
                            }),
                            child: CircleAvatar(
                              radius: 15.0,
                              backgroundColor: Theme.of(context).primaryColor,
                              backgroundImage: NetworkImage(
                                  newsModels![index].publisherChannel!.logo! ??
                                      ""),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () => setState(() {
                              Navigator.pushNamed(context, MegazinPage.id);
                            }),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    newsModels![index]
                                            .publisherChannel!
                                            .name! ??
                                        "",
                                    // textAlign: TextAlign.start,
                                    style: GoogleFonts.acme(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                  newsModels![index].publishedDate.toString() ??
                                      "",
                                  style: GoogleFonts.acme(
                                      // color: HexColor("#C0C0BE"),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 170.0),
                          DialogBox(index: index, id: MegazinPage.id),
                        ],
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            height: 400.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              child: Image.network(
                                newsModels![index].poster!,
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.download_outlined,
                            ),
                          ),
                          Text(
                            newsModels![index].size!.toString() ?? "",
                            style: GoogleFonts.acme(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          const SizedBox(width: 200.0),
                          Text(
                            newsModels![index].viewCount!.toString(),
                            style: GoogleFonts.acme(
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
                    ],
                  ),
                )),
      ),
    );
  }
}
