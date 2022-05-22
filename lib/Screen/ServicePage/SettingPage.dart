// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/Screen/ServicePage/ChangePreferancePage.dart';
import 'package:zena/Screen/ServicePage/EditDisplay.dart';
import 'package:zena/Screen/ServicePage/PersonalInfoPage.dart';

import '../../module/ServicePageConst.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const String id = "setting_Page";

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
            backgroundColor: HexColor("#C0C0BE").withOpacity(0),
            leading: leadingIcon(context),
            title: Text(
              "Settings",
              style: GoogleFonts.acme(
                fontSize: 30.0,
                color: HexColor("#0E0E0E"),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10.0),
          ),
          SliverToBoxAdapter(
            child: titleContent("ACCOUNT"),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Personal Information",
              Icon(
                Icons.person_outline_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              PersonalInfoPage.id,
            ),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Display",
              Icon(
                Icons.wb_sunny_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              EditDisplay.id,
            ),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Change Preferance",
              Icon(
                Icons.grid_view_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              ChangePreferancePage.id,
            ),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Notification",
              Icon(
                Icons.notification_add_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Subscription",
              Icon(
                Icons.subscriptions_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 25.0),
          ),
          SliverToBoxAdapter(
            child: titleContent("SUPPORT"),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Contact Us",
              Icon(
                Icons.contacts_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Invite Friends",
              Icon(
                Icons.person_add_alt_1_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Help Center",
              Icon(
                Icons.help_outline_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "About Us",
              Icon(
                Icons.info_outline,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 25.0),
          ),
          SliverToBoxAdapter(
            child: titleContent("LEGAL"),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Term of Service",
              Icon(
                Icons.file_copy_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Privacy Policy",
              Icon(
                Icons.policy_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 25.0),
          ),
          SliverToBoxAdapter(
            child: Text(
              "ZENA Newsplatform v1.0.0",
              textAlign: TextAlign.center,
              style: GoogleFonts.acme(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10.0),
          ),
          SliverToBoxAdapter(
            child: Text(
              "NEW VERSION AVAILABLE ON PLAYSTORE",
              textAlign: TextAlign.center,
              style: GoogleFonts.acme(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: textButton(context),
          ),
        ],
      ),
    );
  }
}
