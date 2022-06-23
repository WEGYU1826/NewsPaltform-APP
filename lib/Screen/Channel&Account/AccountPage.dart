// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:zena/Screen/ServicePage/SettingPage.dart';
import 'package:zena/module/indiv_Content/resecnt.dart';
import 'package:zena/module/indiv_Content/saved.dart';
import 'package:zena/module/indiv_Content/suscribed.dart';

import '../../ThemeData/theme_preference.dart';
import '../../module/ServicePageConst.dart';
import '../ServicePage/HomePage.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const String id = "account_page";

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
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
      "Saved",
      "Recent",
      "Subscribed",
    ];
    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      length: 3,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          // backgroundColor: HexColor("#E5E5E5"),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  snap: false,
                  backgroundColor: HexColor("#C0C0BE").withOpacity(0),
                  centerTitle: true,
                  elevation: 0.0,
                  // leading: leadingIcon(context),
                  title: logoImage(_themeProvider.darkTheme),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SettingPage.id);
                      },
                      icon: Icon(
                        Icons.settings_outlined,
                        size: 30.0,
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
                    physics: const BouncingScrollPhysics(),
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
                SavedContent(),
                RescentContent(),
                SubscriedContent(),
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
        const SavedContent();
        break;
      case 1:
        const RescentContent();
        break;
      case 2:
        const SubscriedContent();
        break;
    }
  }
}
