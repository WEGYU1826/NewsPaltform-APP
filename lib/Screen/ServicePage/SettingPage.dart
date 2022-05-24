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
      // backgroundColor: HexColor("#E5E5E5"),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: false,
            snap: false,
            elevation: 0.0,
            backgroundColor: HexColor("#C0C0BE").withOpacity(0),
            leading: leadingIcon(context),
            title: Text(
              "Settings",
              style: GoogleFonts.acme(
                fontSize: 30.0,
                color: Theme.of(context).primaryColor,
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
              const Icon(
                Icons.person_outline_outlined,
                size: 20.0,
                // color: HexColor("#0E0E0E"),
              ),
              PersonalInfoPage.id,
            ),
          ),
          SliverToBoxAdapter(
            child: displaySwitch(context),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Change Preferance",
              const Icon(
                Icons.grid_view_outlined,
                size: 20.0,
                // color: HexColor("#0E0E0E"),
              ),
              ChangePreferancePage.id,
            ),
          ),
          SliverToBoxAdapter(
            child: settingContentWithOut(
              context,
              "Notification",
              const Icon(
                Icons.notification_add_outlined,
                size: 20.0,
                // color: HexColor("#0E0E0E"),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: settingContentWithOut(
              context,
              "Subscription",
              const Icon(
                Icons.subscriptions_outlined,
                size: 20.0,
                // color: HexColor("#0E0E0E"),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 25.0),
          ),
          SliverToBoxAdapter(
            child: titleContent("SUPPORT"),
          ),
          SliverToBoxAdapter(
            child: settingContentWithOut(
              context,
              "Contact Us",
              const Icon(
                Icons.contacts_outlined,
                size: 20.0,
                // color: HexColor("#0E0E0E"),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: settingContentWithOut(
              context,
              "Invite Friends",
              const Icon(
                Icons.person_add_alt_1_outlined,
                size: 20.0,
                // color: HexColor("#0E0E0E"),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: settingContentWithOut(
              context,
              "Help Center",
              const Icon(
                Icons.help_outline_outlined,
                size: 20.0,
                // color: HexColor("#0E0E0E"),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: settingContentWithOut(
              context,
              "About Us",
              const Icon(
                Icons.info_outline,
                size: 20.0,
                // color: HexColor("#0E0E0E"),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 25.0),
          ),
          SliverToBoxAdapter(
            child: titleContent("LEGAL"),
          ),
          SliverToBoxAdapter(
            child: settingContentWithOut(
              context,
              "Term of Service",
              const Icon(
                Icons.file_copy_outlined,
                size: 20.0,
                // color: HexColor("#0E0E0E"),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: settingContentWithOut(
              context,
              "Privacy Policy",
              const Icon(
                Icons.policy_outlined,
                size: 20.0,
                // color: HexColor("#0E0E0E"),
              ),
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
