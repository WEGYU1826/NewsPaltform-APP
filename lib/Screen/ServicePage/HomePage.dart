// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:zena/Screen/Channel&Account/ChannelPage.dart';
import 'package:zena/model/news_model.dart';
import 'package:zena/module/DialogBoxForLogoIcons.dart';
import 'package:zena/module/MainContaintCatagories.dart';
import 'package:zena/module/ServicePageConst.dart';
import 'package:zena/module/contConst.dart';
import 'package:zena/module/content_catagories/business.dart';
import 'package:zena/module/content_catagories/entertainments.dart';
import 'package:zena/module/content_catagories/healths.dart';
import 'package:zena/module/content_catagories/politics.dart';
import 'package:zena/module/content_catagories/sports.dart';
import 'package:zena/module/content_catagories/technologys.dart';
import 'package:zena/module/content_catagories/the_indiv_channel_content.dart';

import '../../ThemeData/theme_preference.dart';
import '../../module/MainContaint.dart';
import '../../module/content_build.dart';
import '../../module/content_catagories/treading.dart';

enum ContentCatagory {
  forYou,
  treading,
  politics,
  business,
  sports,
  healths,
  technologys,
  entertainments,
}

final contentCatagoriesValues = EnumValues({
  'politics': ContentCatagory.politics,
  'business': ContentCatagory.business,
  'Sport': ContentCatagory.sports,
  'health': ContentCatagory.healths,
  'technology': ContentCatagory.healths,
  'Entertainment': ContentCatagory.entertainments
});

List<Map<String, dynamic>> channelCatagoryList = [
  {
    'title': 'For You',
    'catagories': ContentCatagory.forYou,
  },
  {
    'title': 'Treading',
    'catagories': ContentCatagory.treading,
  },
  {
    'title': 'Politics',
    'catagories': ContentCatagory.politics,
  },
  {
    'title': 'Business',
    'catagories': ContentCatagory.business,
  },
  {
    'title': 'Sports',
    'catagories': ContentCatagory.sports,
  },
  {
    'title': 'Entertainments',
    'catagories': ContentCatagory.entertainments,
  },
  {
    'title': 'Healths',
    'catagories': ContentCatagory.healths,
  },
  {
    'title': 'Technologys',
    'catagories': ContentCatagory.technologys,
  },
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const List<String> tabs = [
      'For You',
      'Treading',
      'Politics',
      'Business',
      'Sports',
      'Entertainments',
      'Health',
      'Technologys',
    ];

    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      length: 8,
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
                  snap: false,
                  pinned: true,
                  floating: true,
                  elevation: 0.0,
                  // expandedHeight: 100.0,
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
                  // flexibleSpace: FlexibleSpaceBar(
                  //   background: Container(
                  //     decoration: BoxDecoration(
                  //       gradient: LinearGradient(
                  //         begin: Alignment.topCenter,
                  //         end: Alignment.bottomCenter,
                  //         colors: [
                  //           Theme.of(context)
                  //               .scaffoldBackgroundColor
                  //               .withOpacity(0.2), //begin color
                  //           Theme.of(context)
                  //               .scaffoldBackgroundColor
                  //               .withOpacity(1), //end color
                  //         ],
                  //       ),
                  //       borderRadius: const BorderRadius.only(
                  //         bottomLeft: Radius.circular(30.0),
                  //         bottomRight: Radius.circular(30.0),
                  //       ),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(top: 85.0),
                  //       child: ListView.builder(
                  //         scrollDirection: Axis.horizontal,
                  //         shrinkWrap: true,
                  //         itemCount: channelCatagoryList.length,
                  //         itemBuilder: (context, index) => GestureDetector(
                  //           onTap: () {
                  //             setState(() {
                  //               selectedIndex = index;
                  //               catagory = channelCatagoryList[index]['catagories'];
                  //             });
                  //           },
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Container(
                  //               height: 25.0,
                  //               decoration: BoxDecoration(
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                     color: Theme.of(context).accentColor,
                  //                     offset: const Offset(0, 2),
                  //                     spreadRadius: 2.0,
                  //                     blurRadius: 5.0,
                  //                   ),
                  //                 ],
                  //                 color: Theme.of(context).accentColor,
                  //                 borderRadius:
                  //                     const BorderRadius.all(Radius.circular(20.0)),
                  //               ),
                  //               child: Padding(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     horizontal: 7.0, vertical: 7.0),
                  //                 child: Text(
                  //                   channelCatagoryList[index]['title'],
                  //                   style: GoogleFonts.acme(
                  //                     fontSize: 20.0,
                  //                     color: selectedIndex == index
                  //                         ? HexColor("#2E92EE")
                  //                         : Theme.of(context).primaryColor,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: const [
                ContentBuild(),
                TreadingCatagories(),
                PoliticsCatagories(),
                BusinessCatagories(),
                SportCatagories(),
                EntertaimentCatagories(),
                HealthCatagories(),
                TechnologyCatagories(),
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
        const ContentBuild();
        break;
      case 1:
        const TreadingCatagories();
        break;
      case 2:
        const PoliticsCatagories();
        break;
      case 3:
        const BusinessCatagories();
        break;
      case 4:
        const SportCatagories();
        break;
      case 5:
        const EntertaimentCatagories();
        break;
      case 6:
        const TechnologyCatagories();
        break;
    }
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab({
    Key? key,
    required this.width,
    required this.label,
  }) : super(key: key);

  final double width;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Tab(
        text: label,
      ),
    );
  }
}
