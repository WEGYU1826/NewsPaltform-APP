// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:zena/module/DialogBoxForLogoIcons.dart';
import 'package:zena/module/MainContaintCatagories.dart';
import 'package:zena/module/ServicePageConst.dart';
import 'package:zena/module/contConst.dart';

import '../../ThemeData/theme_preference.dart';
import '../../module/MainContaint.dart';

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
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [
                  //     HexColor("#C0C0BE"), //begin color
                  //     HexColor("#E5E5E5"), //end color
                  //   ],
                  // ),
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
          MainContent(list: container_1),
        ],
      ),
    );
  }
}
