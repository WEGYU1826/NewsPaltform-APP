// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:zena/module/ChannelDescription.dart';
import 'package:zena/module/ServicePageConst.dart';
import 'package:zena/module/content_catagories/ind_channel_content_by_ID/business.dart';
import 'package:zena/module/content_catagories/ind_channel_content_by_ID/enter.dart';
import 'package:zena/module/content_catagories/ind_channel_content_by_ID/health.dart';
import 'package:zena/module/content_catagories/ind_channel_content_by_ID/politics.dart';
import 'package:zena/module/content_catagories/ind_channel_content_by_ID/sport.dart';
import 'package:zena/module/content_catagories/the_indiv_channel_content.dart';

import '../../ThemeData/theme_preference.dart';
import '../../module/DialogBox_2.dart';
import '../ServicePage/HomePage.dart';

class ChannelPage extends StatefulWidget {
  String? imageURL;
  String? contentID;
  String? channelName;
  ChannelPage({
    Key? key,
    required this.contentID,
    required this.imageURL,
    required this.channelName,
  }) : super(key: key);
  static const String id = "channel_page";

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const List<String> tabs = [
      "All",
      "Politics",
      "Business",
      "Sports",
      "Health",
      "Entertainments",
    ];

    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      length: 6,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          // backgroundColor: HexColor("#E5E5E5"),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  snap: false,
                  elevation: 0.0,
                  expandedHeight: 360.0,
                  backgroundColor: HexColor("#C0C0BE").withOpacity(0),
                  centerTitle: true,
                  leading: leadingIcon(context),
                  title: logoImage(_themeProvider.darkTheme),
                  actions: [
                    DialogBoxForVerElip(),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        backdropFilter(context, widget.imageURL!),
                        ChannelDescription(
                          imageURl: widget.imageURL!,
                          name: widget.channelName!,
                          id: widget.contentID!,
                        ),
                      ],
                    ),
                  ),
                  bottom: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    onTap: _handleTabTapped,
                    labelColor: HexColor("#2E92EE"),
                    labelStyle: GoogleFonts.acme(fontSize: 20.0),
                    indicatorWeight: 1.0,
                    indicatorColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Theme.of(context).primaryColor,
                    unselectedLabelStyle: GoogleFonts.acme(fontSize: 15.0),
                    tabs: [
                      for (String tab in tabs)
                        CustomTab(
                          width: 78,
                          label: tab,
                        ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                IndivisualChannelTest(contentID: widget.contentID),
                PoliticsChannelDataByID(contentID: widget.contentID),
                BusinessChannelDataByID(contentID: widget.contentID),
                SportChannelDataByID(contentID: widget.contentID),
                HealthChannelDataByID(contentID: widget.contentID),
                EntertementChannelDataByID(contentID: widget.contentID),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleTabTapped(int index) {
    switch (index) {
      case 0:
        IndivisualChannelTest(contentID: widget.contentID);
        break;
      case 1:
        PoliticsChannelDataByID(contentID: widget.contentID);
        break;
      case 2:
        BusinessChannelDataByID(contentID: widget.contentID);
        break;
      case 3:
        SportChannelDataByID(contentID: widget.contentID);
        break;
      case 4:
        HealthChannelDataByID(contentID: widget.contentID);
        break;
      case 5:
        EntertementChannelDataByID(contentID: widget.contentID);
        break;
    }
  }
}
