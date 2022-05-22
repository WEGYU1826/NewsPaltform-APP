// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/Screen/ServicePage/SettingPage.dart';
import 'package:zena/module/AccountCatagories.dart';
import 'package:zena/module/contConst.dart';

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
    return Scaffold(
      backgroundColor: HexColor("#E5E5E5"),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: true,
            backgroundColor: HexColor("#C0C0BE").withOpacity(0),
            expandedHeight: 205.0,
            centerTitle: true,
            elevation: 0.0,
            leading: leadingIcon(context),
            title: logoImage(),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SettingPage.id);
                },
                icon: Icon(
                  Icons.settings,
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
                      HexColor("#C0C0BE"),
                      HexColor("#E5E5E5"), //begin color
                      //end color
                    ],
                  ),
                  color: HexColor("#C0C0BE"),
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
                          CircleAvatar(
                            maxRadius: 50.0,
                            backgroundImage: const AssetImage(
                                "assets/images/light/logo.png"),
                            backgroundColor:
                                Theme.of(context).primaryColorLight,
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
                                  children: [
                                    Text(
                                      "69",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#0E0E0E"),
                                      ),
                                    ),
                                    const SizedBox(width: 5.0),
                                    Icon(
                                      Icons.remove_red_eye,
                                      color: HexColor("#0E0E0E"),
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
