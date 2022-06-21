// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:zena/module/ChannelDescription.dart';
import 'package:zena/module/ServicePageConst.dart';
import 'package:zena/module/contConst.dart';
import 'package:zena/module/content_catagories/the_indiv_channel_content.dart';

import '../../ThemeData/theme_preference.dart';
import '../../model/channel_model.dart';
import '../../module/ChannalCatagories.dart';
import '../../module/DialogBox_2.dart';
import '../../module/MainContaint.dart';
import '../../provider/indivsual_channel.dart/the_channel.dart';

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

class _ChannelPageState extends State<ChannelPage> {
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
            snap: false,
            elevation: 0.0,
            expandedHeight: 320.0,
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
          ),
        ],
      ),
    );
  }
}
