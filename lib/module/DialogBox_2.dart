// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../ThemeData/theme_preference.dart';

class DialogBoxForVerElip extends StatefulWidget {
  DialogBoxForVerElip({Key? key}) : super(key: key);
  int? index;

  @override
  State<DialogBoxForVerElip> createState() => _DialogBoxForVerElipState();
}

class _DialogBoxForVerElipState extends State<DialogBoxForVerElip> {
  int selectedIndex_1 = 0;
  @override
  Widget build(BuildContext context) {
    return buildDialogBox();
  }

  Widget buildDialogBox() {
    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      onPressed: () {
        _themeProvider.darkTheme = !_themeProvider.darkTheme;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            alignment: Alignment.topRight,
            elevation: 0.0,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buidPopUpContent(
                  "Share",
                  Icon(
                    Icons.share_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 20.0,
                  ),
                ),
                buidPopUpContent(
                  "Subscription",
                  Icon(
                    Icons.subscriptions_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 20.0,
                  ),
                ),
                buidPopUpContent(
                  "See Description",
                  Icon(
                    Icons.description_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 20.0,
                  ),
                ),
                buidPopUpContent(
                  "Report Issue",
                  Icon(
                    Icons.report_problem_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      icon: Icon(
        FontAwesomeIcons.ellipsisVertical,
        size: 30.0,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget buidPopUpContent(string, icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 10.0),
            Text(
              string,
              style: GoogleFonts.acme(
                fontSize: 16.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
