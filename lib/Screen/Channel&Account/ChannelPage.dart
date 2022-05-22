// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/module/ChannelDescription.dart';
import 'package:zena/module/ServicePageConst.dart';
import 'package:zena/module/contConst.dart';

import '../../module/DialogBox_2.dart';
import '../../module/MainContaint.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({Key? key}) : super(key: key);
  static const String id = "channel_page";

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
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
            expandedHeight: 320.0,
            backgroundColor: HexColor("#C0C0BE").withOpacity(0),
            centerTitle: true,
            leading: leadingIcon(context),
            title: logoImage(),
            actions: [
              DialogBoxForVerElip(),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  backdropFilter(context, "assets/images/channel/Rep.png"),
                  ChannelDescription(
                    imageURl: "assets/images/channel/Rep.png",
                    name: "The Reporter",
                  ),
                ],
              ),
            ),
          ),
          MainContent(list: container_1),
        ],
      ),
    );
  }
}
