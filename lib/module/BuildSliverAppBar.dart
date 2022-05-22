// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'ServicePageConst.dart';

class BuilSliverAppBar extends StatefulWidget {
  BuilSliverAppBar({Key? key, required this.title}) : super(key: key);
  String? title;

  @override
  State<BuilSliverAppBar> createState() => _BuilSliverAppBarState();
}

class _BuilSliverAppBarState extends State<BuilSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return builSliverAppBar(context, widget.title!);
  }

  Widget builSliverAppBar(context, title) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      snap: true,
      elevation: 0.0,
      backgroundColor: HexColor("#C0C0BE").withOpacity(0),
      leading: leadingIcon(context),
      title: Text(
        title,
        style: GoogleFonts.acme(
          fontSize: 30.0,
          color: HexColor("#0E0E0E"),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: TextButton(
            onPressed: () {},
            child: Text(
              "SAVE",
              style: GoogleFonts.acme(
                color: HexColor("#C0C0BE"),
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
