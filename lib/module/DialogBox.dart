// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DialogBox extends StatefulWidget {
  int? index;
  DialogBox({Key? key, required this.index}) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  int selectedIndex_1 = 0;
  @override
  Widget build(BuildContext context) {
    return buildDialogBox(widget.index!);
  }

  Widget buildDialogBox(index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex_1 = index;
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            alignment: Alignment.centerRight,
            elevation: 0.0,
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
                buidPopUpContent(
                  "Go to Channel",
                  const Icon(
                    Icons.navigation_outlined,
                    // color: HexColor("#0E0E0E"),
                    size: 20.0,
                  ),
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
        color: selectedIndex_1 == index
            ? HexColor("#2E92EE")
            : HexColor("#C0C0BE"),
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
