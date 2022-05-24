// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class AccountCatagorie extends StatefulWidget {
  AccountCatagorie({Key? key, required this.list}) : super(key: key);
  List? list;

  @override
  State<AccountCatagorie> createState() => _AccountCatagorieState();
}

class _AccountCatagorieState extends State<AccountCatagorie> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return accountCatagories(context, widget.list!);
  }

  Expanded accountCatagories(context, list) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 28.0, right: 28.0, bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Text(
                  list[index],
                  style: GoogleFonts.acme(
                    fontSize: 25.0,
                    color: selectedIndex == index
                        ? HexColor("#2E92EE")
                        : Theme.of(context).primaryColor,
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
