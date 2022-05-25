// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MainContaintCatagories extends StatefulWidget {
  MainContaintCatagories({Key? key, required this.list}) : super(key: key);
  List? list;

  @override
  State<MainContaintCatagories> createState() => _MainContaintCatagoriesState();
}

class _MainContaintCatagoriesState extends State<MainContaintCatagories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return mainContaintCatagories(widget.list!);
  }

  Widget mainContaintCatagories(List list) {
    return ListView.builder(
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
            height: 25.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).accentColor,
                  offset: const Offset(0, 2),
                  spreadRadius: 2.0,
                  blurRadius: 5.0,
                ),
              ],
              color: Theme.of(context).accentColor,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
              child: Text(
                list[index],
                style: GoogleFonts.acme(
                  fontSize: 20.0,
                  color: selectedIndex == index
                      ? HexColor("#2E92EE")
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
