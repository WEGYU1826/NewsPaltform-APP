// ignore_for_file: file_names
import 'dart:collection';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'package:zena/module/ServicePageConst.dart';
import 'package:zena/module/contConst.dart';

import '../../ThemeData/theme_preference.dart';
import '../../module/PreferanceButton.dart';
import 'SignUpScreen.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({Key? key}) : super(key: key);
  static const String id = "preferance_screen";

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  HashSet selectedItem = HashSet();
  int selectedItemNum = 0;

  @override
  Widget build(BuildContext context) {
    // final ThemeProvider _themeProvider = ThemeProvider();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // authLogo(_themeProvider.darkTheme),
                const SizedBox(height: 40.0),
                authDescription("Choose Your News Preferance For Better"),
                StaggeredGridView.countBuilder(
                  padding: const EdgeInsets.all(10.0),
                  shrinkWrap: true,
                  staggeredTileBuilder: (int index) =>
                      const StaggeredTile.count(1, 1),
                  itemCount: container_4.length,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      doMultiSelected(container_4[index].imagURL!);
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            container_4[index].imagURL!,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                            color: HexColor("#2E92EE").withOpacity(selectedItem
                                    .contains(container_4[index].imagURL)
                                ? 1
                                : 0),
                            colorBlendMode: BlendMode.color,
                          ),
                        ),
                        Positioned(
                          bottom: 10.0,
                          left: 10.0,
                          child: Text(
                            container_4[index].name!,
                            style: GoogleFonts.acme(
                              fontSize: 30.0,
                              color: HexColor("#FEFEFE"),
                            ),
                          ),
                        ),
                        Visibility(
                          visible:
                              selectedItem.contains(container_4[index].imagURL),
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.check,
                              size: 30.0,
                              color: HexColor("#FEFEFE"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                selectedItemNum >= 3
                    ? PreferanceButton(
                        color: HexColor("#2E92EE"),
                        string: 'DONE',
                        selectedItemNum: selectedItemNum,
                      )
                    : PreferanceButton(
                        color: HexColor("#D8D8D8"),
                        string: 'Selecte 3 or more Preferance',
                        selectedItemNum: selectedItemNum,
                      ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.acme(
                      color: Colors.grey,
                      fontSize: 15.0,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: "By Continuing, you accept "),
                      TextSpan(
                        text: " Terms of Use and Privacy Policy",
                        style: GoogleFonts.acme(
                          color: HexColor("#2E92EE"),
                          fontSize: 15.0,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, SignUpPage.id);
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void doMultiSelected(String path) {
    setState(
      () {
        if (selectedItem.contains(path)) {
          selectedItem.remove(path);
          selectedItemNum--;
        } else {
          selectedItem.add(path);
          selectedItemNum++;
        }
      },
    );
  }
}
