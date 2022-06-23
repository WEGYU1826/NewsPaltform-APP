// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../ThemeData/theme_preference.dart';
import '../../module/DialogBoxForLogoIcons.dart';
import '../../module/ServicePageConst.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const String id = "search_page";

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? searchContent;
  @override
  Widget build(BuildContext context) {
    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // backgroundColor: Theme.of(context).accentColor,
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
            // leading: leadingIcon(context),
            title: logoImage(_themeProvider.darkTheme),
            actions: [
              DialogBoxForLogoIcons(
                icon: Icon(
                  FontAwesomeIcons.bars,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                // textAlign: TextAlign.center,
                onChanged: (value) {
                  searchContent = value;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: HexColor("#2E92EE"),
                  hintText: "Search...",
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    borderSide:
                        BorderSide(color: HexColor("#2E92EE"), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    borderSide:
                        BorderSide(color: HexColor("#2E92EE"), width: 3.0),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/search.png",
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.width / 2,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                ),
                Text(
                  "No Results Found",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.acme(fontSize: 20.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
