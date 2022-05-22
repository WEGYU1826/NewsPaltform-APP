// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "WEGYU",
                            style: GoogleFonts.acme(
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            "wegyu@gmail.com",
                            style: GoogleFonts.acme(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        FontAwesomeIcons.user,
                        color: HexColor("#0E0E0E"),
                        size: 20.0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  divider(),
                  buidPopUpContent(
                    "Account Setting",
                    Icon(
                      Icons.settings,
                      color: HexColor("#0E0E0E"),
                      size: 20.0,
                    ),
                  ),
                  buidPopUpContent(
                    "Change Preferance",
                    Icon(
                      Icons.grid_view_outlined,
                      color: HexColor("#0E0E0E"),
                      size: 20.0,
                    ),
                  ),
                  divider(),
                  buidPopUpContent(
                    "Light Theme",
                    Icon(
                      Icons.light_mode_outlined,
                      color: HexColor("#0E0E0E"),
                      size: 20.0,
                    ),
                  ),
                  buidPopUpContent(
                    "Dark Theme",
                    Icon(
                      Icons.dark_mode_outlined,
                      color: HexColor("#0E0E0E"),
                      size: 20.0,
                    ),
                  ),
                  buidPopUpContent(
                    "System Theme",
                    Icon(
                      Icons.display_settings_outlined,
                      color: HexColor("#0E0E0E"),
                      size: 20.0,
                    ),
                  ),
                  divider(),
                  buidPopUpContent(
                    "Sign Out",
                    Icon(
                      Icons.logout_outlined,
                      color: HexColor("#0E0E0E"),
                      size: 20.0,
                    ),
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

  Widget buidPopUpContent(String string, Icon icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              string,
              style: GoogleFonts.acme(fontSize: 16.0),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
