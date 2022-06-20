// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // backgroundColor: Theme.of(context).accentColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: false,
            snap: false,
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
                  child: MainContaintCatagories(list: label_1),
                ),
              ),
            ),
          ),
          // MainContent(),
          const IndivisualChannelTest(),
        ],
      ),
    );
  }
}
