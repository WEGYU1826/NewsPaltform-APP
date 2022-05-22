// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/Screen/ServicePage/EditEmail.dart';
import 'package:zena/Screen/ServicePage/EditName.dart';
import 'package:zena/Screen/ServicePage/EditPassword.dart';

import '../../module/ServicePageConst.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);
  static const String id = "personal_info";

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
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
              "Personal Information",
              style: GoogleFonts.acme(
                fontSize: 30.0,
                color: HexColor("#0E0E0E"),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Name",
              Icon(
                Icons.person_add_alt_1_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              EditName.id,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Email",
              Icon(
                Icons.email_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              EditEmail.id,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Password",
              Icon(
                Icons.lock_outline,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              EditPassword.id,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Account Type",
              Icon(
                Icons.no_accounts_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "View Count",
              Icon(
                Icons.view_array_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Subscription Count",
              Icon(
                Icons.subscriptions_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Download Count",
              Icon(
                Icons.download_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          SliverToBoxAdapter(
            child: settingContent(
              context,
              "Accout Created At",
              Icon(
                Icons.create_outlined,
                size: 20.0,
                color: HexColor("#0E0E0E"),
              ),
              "",
            ),
          ),
        ],
      ),
    );
  }
}
