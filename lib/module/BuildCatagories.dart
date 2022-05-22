import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Catagories extends StatefulWidget {
  Catagories({Key? key, required this.list}) : super(key: key);
  List? list;

  @override
  State<Catagories> createState() => _CatagoriesState();
}

class _CatagoriesState extends State<Catagories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return buildCatagories(widget.list!);
  }

  SizedBox buildCatagories(list) {
    return SizedBox(
      height: 35.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? HexColor("#C0C0BE")
                      : Theme.of(context).primaryColorLight,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text(
                    list[index],
                    style: GoogleFonts.acme(
                      color: index == selectedIndex
                          ? HexColor("#2E92EE")
                          : HexColor("#0E0E0E"),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
