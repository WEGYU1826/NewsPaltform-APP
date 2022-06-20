// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:zena/module/BuildLogoList.dart';
import 'package:zena/module/contConst.dart';
import 'package:zena/module/content_build.dart';

import '../../ThemeData/theme_preference.dart';
import '../../module/ChannelDescription.dart';
import '../../module/DialogBox_2.dart';
import '../../module/ServicePageConst.dart';

class MegazinPage extends StatefulWidget {
  const MegazinPage({Key? key}) : super(key: key);
  static const String id = "megazin_page";

  @override
  State<MegazinPage> createState() => _MegazinPageState();
}

class _MegazinPageState extends State<MegazinPage> {
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
            expandedHeight: 325.0,
            backgroundColor: HexColor("#C0C0BE").withOpacity(0),
            leading: leadingIcon(context),
            centerTitle: true,
            title: logoImage(_themeProvider.darkTheme),
            actions: [
              DialogBoxForVerElip(),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  backdropFilter(context, "assets/images/megazin/link.png"),
                  ChannelDescription(
                    imageURl: "assets/images/megazin/link.png",
                    name: "LinkUp Addis",
                  ),
                ],
              ),
            ),
          ),
          // BuildLogoList(list: container_0),
          const ContentBuild(),
        ],
      ),
    );
  }
}
