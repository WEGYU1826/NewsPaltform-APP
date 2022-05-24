// ignore_for_file: file_names

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class ToBeSelectedCatagories extends StatefulWidget {
  ToBeSelectedCatagories({Key? key, required this.selectedType})
      : super(key: key);
  List<String>? selectedType;

  @override
  State<ToBeSelectedCatagories> createState() => _ToBeSelectedCatagoriesState();
}

class _ToBeSelectedCatagoriesState extends State<ToBeSelectedCatagories> {
  HashSet selectedItem = HashSet();
  @override
  Widget build(BuildContext context) {
    return toBeSelectedCatagories(context, widget.selectedType!);
  }

  Widget toBeSelectedCatagories(context, string) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: string.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: GestureDetector(
          onTap: () {
            doMultiSelected(string[index]);
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: selectedItem.contains(string[index])
                  ? HexColor("#2E92EE")
                  : HexColor("#C0C0BE"),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 12.0),
              child: Text(
                string[index],
                style: GoogleFonts.acme(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void doMultiSelected(String path) {
    setState(() {
      if (selectedItem.contains(path)) {
        selectedItem.remove(path);
      } else {
        selectedItem.add(path);
      }
    });
  }
}
