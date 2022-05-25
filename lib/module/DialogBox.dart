// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DialogBox extends StatefulWidget {
  int? index;
  String? id;
  DialogBox({
    Key? key,
    required this.index,
    required this.id,
  }) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return buildDialogBox(widget.index!, widget.id!);
  }

  Widget buildDialogBox(int index, String id) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            alignment: Alignment.centerRight,
            elevation: 2.0,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buidPopUpContent(
                  "Save",
                  const Icon(
                    Icons.save_outlined,
                    // color: HexColor("#0E0E0E"),
                    size: 20.0,
                  ),
                ),
                buidPopUpContent(
                  "Share",
                  const Icon(
                    Icons.share_outlined,
                    // color: HexColor("#0E0E0E"),
                    size: 20.0,
                  ),
                ),
                goToChannel(
                  "Go to Channel",
                  const Icon(
                    Icons.navigation_outlined,
                    // color: HexColor("#0E0E0E"),
                    size: 20.0,
                  ),
                  id,
                ),
                buidPopUpContent(
                  "Report Issue",
                  const Icon(
                    Icons.report_problem_outlined,
                    // color: HexColor("#0E0E0E"),
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Icon(
        FontAwesomeIcons.ellipsis,
        color: selectedIndex == index
            ? HexColor("#2E92EE")
            : Theme.of(context).primaryColor,
      ),
    );
  }

  Widget buidPopUpContent(String string, Icon icon) {
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

  Widget goToChannel(String string, Icon icon, String id) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, id);
        },
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
