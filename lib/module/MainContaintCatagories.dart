// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/Screen/ServicePage/HomePage.dart';
import 'package:zena/module/content_catagories/treading.dart';

class MainContaintCatagories extends StatefulWidget {
  MainContaintCatagories({Key? key, required this.list}) : super(key: key);
  List? list;

  @override
  State<MainContaintCatagories> createState() => _MainContaintCatagoriesState();
}

class _MainContaintCatagoriesState extends State<MainContaintCatagories> {
  int selectedIndex = 0;
  late ContentCatagory catagory;
  @override
  Widget build(BuildContext context) {
    return mainContaintCatagories(context);
  }

  Widget mainContaintCatagories(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: channelCatagoryList.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
            catagory = channelCatagoryList[index]['catagories'];
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
                channelCatagoryList[index]['title'],
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
