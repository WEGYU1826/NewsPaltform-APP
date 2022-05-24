// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class ChannalCatagorie extends StatefulWidget {
  ChannalCatagorie({Key? key, required this.list}) : super(key: key);
  List? list;

  @override
  State<ChannalCatagorie> createState() => _ChannalCatagorieState();
}

class _ChannalCatagorieState extends State<ChannalCatagorie> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return channalCatagories(widget.list!);
  }

  Widget channalCatagories(List list) {
    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Text(
                  list[index],
                  style: GoogleFonts.acme(
                    fontSize: 20.0,
                    color: selectedIndex == index
                        ? HexColor("#2E92EE")
                        : HexColor("#0E0E0E"),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
