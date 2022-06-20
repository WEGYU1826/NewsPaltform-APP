// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../ThemeData/theme_preference.dart';
import '../../model/channel_model.dart';
import '../../module/DialogBoxForLogoIcons.dart';
import '../../module/ServicePageConst.dart';
import '../../provider/ChanneContentl.dart';
import '../Channel&Account/ChannelPage.dart';

class ChannelListAccordingToType extends StatefulWidget {
  const ChannelListAccordingToType({Key? key}) : super(key: key);
  static const String id = "channel_list";

  @override
  State<ChannelListAccordingToType> createState() =>
      _ChannelListAccordingToTypeState();
}

class _ChannelListAccordingToTypeState
    extends State<ChannelListAccordingToType> {
  int selectedIndex = 0;
  List<Doc>? channelModels;
  var isLoaded = false;
  List<Map<String, dynamic>> channelCatagoryList = [
    {
      'title': 'Magazins',
      'catagories': NewsType.magazine,
    },
    {
      'title': 'News Papers',
      'catagories': NewsType.newspaper,
    },
    {
      'title': 'Articles',
      'catagories': NewsType.article,
    },
  ];
  NewsType catagory = NewsType.magazine;
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

  List<Doc>? getChannel(NewsType newsType) {
    List<Doc>? channels = channelModels
        ?.where((Doc channnel) => channnel.newsType == newsType)
        .toList();
    return channels;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // backgroundColor: HexColor("#E5E5E5"),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: true,
            elevation: 0.0,
            expandedHeight: 100.0,
            backgroundColor: HexColor("#C0C0BE").withOpacity(0),
            centerTitle: true,
            leading: leadingIcon(context),
            title: logoImage(_themeProvider.darkTheme),
            actions: [
              DialogBoxForLogoIcons(
                icon: Icon(
                  FontAwesomeIcons.bars,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 85.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: channelCatagoryList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            catagory = channelCatagoryList[index]['catagories'];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 20.0, right: 20.0, bottom: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).accentColor,
                                  offset: const Offset(1, 1),
                                  spreadRadius: 2.0,
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Text(
                                channelCatagoryList[index]['title'],
                                style: GoogleFonts.acme(
                                  fontSize: 25.0,
                                  color: selectedIndex == index
                                      ? HexColor("#2E92EE")
                                      : Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          // BuidChannelList(channelType: catagory),
          SliverToBoxAdapter(
            child: Visibility(
              visible: isLoaded,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                primary: false,
                shrinkWrap: true,
                itemCount: getChannel(catagory)?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ChannelPage.id);
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
                                  getChannel(catagory)![index].logo!,
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
                            getChannel(catagory)![index].name!,
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
            ),
          )
        ],
      ),
    );
  }
}
