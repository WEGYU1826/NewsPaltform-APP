// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zena/Screen/Authentication/LogInScreen.dart';
import 'package:zena/Screen/Authentication/PrefrenceScreen.dart';
import 'package:zena/Screen/Authentication/SignUpScreen.dart';
import 'package:zena/Screen/ServicePage/ChangePreferancePage.dart';
import 'package:zena/Screen/ServicePage/PersonalInfoPage.dart';
import 'package:zena/Screen/ServicePage/SettingPage.dart';

import 'ServicePageConst.dart';

class DialogBoxForLogoIcons extends StatefulWidget {
  DialogBoxForLogoIcons({Key? key, required this.icon}) : super(key: key);
  Icon? icon;

  @override
  State<DialogBoxForLogoIcons> createState() => _DialogBoxForLogoIconsState();
}

class _DialogBoxForLogoIconsState extends State<DialogBoxForLogoIcons> {
  @override
  Widget build(BuildContext context) {
    return logoIcon(context, widget.icon!);
  }

  IconButton logoIcon(context, icon) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              alignment: Alignment.topRight,
              elevation: 0.0,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PersonalInfoPage.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "WEGYU",
                              style: GoogleFonts.acme(
                                fontSize: 20.0,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              "wegyu@gmail.com",
                              style: GoogleFonts.acme(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          FontAwesomeIcons.user,
                          size: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  divider(),
                  buidPopUpContent(
                    "Account Setting",
                    Icon(
                      Icons.settings_outlined,
                      size: 20.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    SettingPage.id,
                  ),
                  buidPopUpContent(
                    "Change Preferance",
                    Icon(
                      Icons.grid_view_outlined,
                      size: 20.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    ChangePreferancePage.id,
                  ),
                  divider(),
                  displaySweitch(),
                  divider(),
                  buidPopUpContent(
                    "Sign Out",
                    Icon(
                      Icons.logout_outlined,
                      size: 20.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    LoginPage.id,
                  ),
                  divider(),
                ],
              ),
            );
          },
        );
      },
      icon: icon,
    );
  }

  Widget buidPopUpContent(String string, Icon icon, String id) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, id);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              string,
              style: GoogleFonts.acme(
                fontSize: 16.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            icon,
          ],
        ),
      ),
    );
  }

  Widget displaySweitch() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dark Theme",
              style: GoogleFonts.acme(
                fontSize: 16.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const ChangeThemeButtonWidget(),
          ],
        ),
      ),
    );
  }
}
