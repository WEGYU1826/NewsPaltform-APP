// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:zena/Screen/ServicePage/SettingPage.dart';
import 'package:zena/module/AccountCatagories.dart';
import 'package:zena/module/contConst.dart';

import '../../ThemeData/theme_preference.dart';
import '../../module/MainContaint.dart';
import '../../module/ServicePageConst.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const String id = "account_page";

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // backgroundColor: HexColor("#E5E5E5"),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            snap: false,
            backgroundColor: HexColor("#C0C0BE").withOpacity(0),
            expandedHeight: 205.0,
            centerTitle: true,
            elevation: 0.0,
            leading: leadingIcon(context),
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
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.2), //begin color
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(1), //begin color
                      //end color
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 90.0, left: 30.0),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            maxRadius: 50.0,
                            backgroundImage:
                                AssetImage("assets/images/light/logo.png"),
                            backgroundColor: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sylvester \n Malone",
                                  style: GoogleFonts.acme(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "69",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        // color: HexColor("#0E0E0E"),
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    Icon(
                                      Icons.remove_red_eye,
                                      // color: HexColor("#0E0E0E"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    AccountCatagorie(list: label_3),
                  ],
                ),
              ),
            ),
          ),
          MainContent(list: container_1)
        ],
      ),
    );
  }
}
