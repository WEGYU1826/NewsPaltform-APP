// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/Screen/Channel&Account/ChannelPage.dart';
import 'package:zena/module/ChannalCatagoriList.dart';
import 'package:zena/module/contConst.dart';

import '../../module/BuidChannelList.dart';
import '../../module/DialogBoxForLogoIcons.dart';
import '../../module/ServicePageConst.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#E5E5E5"),
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
            title: logoImage(),
            actions: [
              DialogBoxForLogoIcons(
                icon: Icon(
                  FontAwesomeIcons.bars,
                  size: 30.0,
                  color: HexColor("#0E0E0E"),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      HexColor("#C0C0BE"), //begin color
                      HexColor("#E5E5E5"), //end color
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 85.0),
                  child: ChannelCatagorieList(list: label_2),
                ),
              ),
            ),
          ),
          BuidChannelList(list: container_3),
        ],
      ),
    );
  }
}
