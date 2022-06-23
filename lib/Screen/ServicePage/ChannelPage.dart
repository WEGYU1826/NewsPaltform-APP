// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:zena/module/channel_catagory/article.dart';
import 'package:zena/module/channel_catagory/megazin.dart';
import 'package:zena/module/channel_catagory/newsPaper.dart';

import '../../ThemeData/theme_preference.dart';
import '../../module/DialogBoxForLogoIcons.dart';
import '../../module/ServicePageConst.dart';
import 'HomePage.dart';

class ChannelPageWithCatagories extends StatefulWidget {
  const ChannelPageWithCatagories({Key? key}) : super(key: key);
  static const String id = "channel_page";

  @override
  State<ChannelPageWithCatagories> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPageWithCatagories>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const List<String> tabs = [
      "News Papers",
      "Magazines",
      "Articles",
    ];
    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      length: 3,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          // backgroundColor: Theme.of(context).accentColor,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  snap: true,
                  pinned: true,
                  floating: true,
                  elevation: 0.0,
                  // expandedHeight: 100.0,
                  backgroundColor: HexColor("#C0C0BE").withOpacity(0),
                  centerTitle: true,
                  // leading: leadingIcon(context),
                  title: logoImage(_themeProvider.darkTheme),
                  actions: [
                    DialogBoxForLogoIcons(
                      icon: Icon(
                        FontAwesomeIcons.bars,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
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
                          width: 105,
                          label: tab,
                        ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: const [
                NewsPaperCannelCatagories(),
                MagazinChannelCatagoris(),
                ArticleChannelCatagories(),
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
        const NewsPaperCannelCatagories();
        break;
      case 1:
        const MagazinChannelCatagoris();
        break;
      case 2:
        const ArticleChannelCatagories();
        break;
    }
  }
}
