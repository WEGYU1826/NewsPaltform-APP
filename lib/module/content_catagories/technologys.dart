import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/Screen/Channel&Account/ChannelPage.dart';

import 'package:zena/module/DialogBox.dart';
import 'package:zena/module/read.dart';
import 'package:zena/provider/news_catagories/TechnologyContent.dart';

import '../../model/news_model.dart';

class TechnologyCatagories extends StatefulWidget {
  const TechnologyCatagories({Key? key}) : super(key: key);

  @override
  State<TechnologyCatagories> createState() => _TechnologyCatagoriesState();
}

class _TechnologyCatagoriesState extends State<TechnologyCatagories> {
  List<News>? contentModels;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    contentModels =
        (await RemoteService().getTechnologyNewsContent()) as List<News>;
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
          color: HexColor('##2E92EE'),
          size: 50.0,
        ),
      ),
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: contentModels?.length,
        itemBuilder: (context, index) {
          return contentModels![index].newsType == NewsType.magazine
              ? Padding(
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
                              onBackgroundImageError: (exception, stackTrace) =>
                                  const Icon(Icons.error_outline),
                              radius: 15.0,
                              backgroundColor: Theme.of(context).primaryColor,
                              backgroundImage: NetworkImage(
                                  contentModels![index]
                                      .publisherChannel!
                                      .logo!),
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
                                Text(
                                  contentModels![index].publisherChannel!.name!,
                                  // textAlign: TextAlign.start,
                                  style: GoogleFonts.acme(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  contentModels![index]
                                      .publishedDate!
                                      .toString(),
                                  style: GoogleFonts.acme(
                                      // color: HexColor("#C0C0BE"),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 170.0),
                          // DialogBox(index: index, id: ""),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          height: 500.0,
                          width: 330.0,
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
                              contentModels![index].poster!,
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              errorBuilder: (context, obj, stacktrace) =>
                                  const Icon(Icons.error_outline),
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
                            contentModels![index].size.toString(),
                            style: GoogleFonts.acme(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          const SizedBox(width: 200.0),
                          Text(
                            contentModels![index].viewCount!.toString(),
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
                      const SizedBox(height: 25.0),
                    ],
                  ),
                )
              : Padding(
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
                                  contentModels![index]
                                      .publisherChannel!
                                      .logo!),
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
                                Text(
                                    contentModels![index]
                                        .publisherChannel!
                                        .name!,
                                    // textAlign: TextAlign.start,
                                    style: GoogleFonts.acme(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                  contentModels![index]
                                      .publishedDate
                                      .toString(),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  contentModels![index].description!,
                                  style: GoogleFonts.acme(
                                    fontSize: 16.0,
                                  ),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15.0, top: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => ReadContent(
                                                        title: contentModels![
                                                                index]
                                                            .title,
                                                        name: contentModels![
                                                                index]
                                                            .publisherChannel!
                                                            .name,
                                                        poster: contentModels![
                                                                index]
                                                            .poster,
                                                        description:
                                                            contentModels![
                                                                    index]
                                                                .description,
                                                        time: contentModels![
                                                                index]
                                                            .publishedDate!
                                                            .minute
                                                            .toString(),
                                                        publisher:
                                                            contentModels![
                                                                    index]
                                                                .authors,
                                                      )));
                                        },
                                        icon: const Icon(
                                            Icons.arrow_downward_outlined),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        contentModels![index]
                                            .viewCount!
                                            .toString(),
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
