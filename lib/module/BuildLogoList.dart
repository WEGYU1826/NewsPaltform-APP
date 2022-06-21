// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:zena/module/BuildDialogBox.dart';

class BuildLogoList extends StatefulWidget {
  BuildLogoList({Key? key, required this.list}) : super(key: key);
  List? list;

  @override
  State<BuildLogoList> createState() => _BuildLogoListState();
}

class _BuildLogoListState extends State<BuildLogoList> {
  @override
  Widget build(BuildContext context) {
    return buidMegazinContent(context, widget.list!);
  }

  int selectedIndex_1 = 0;
  Widget buidMegazinContent(context, list) => SliverToBoxAdapter(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          primary: false,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                BuildDialogBox(index: index, list: list, id: ""),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: 300.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      child: Image.asset(
                        list[index].imagURL!,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.download_outlined,
                      ),
                    ),
                    Text(
                      list[index].downSize!,
                      style: GoogleFonts.acme(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    const SizedBox(width: 200.0),
                    Text(
                      list[index].numbers!,
                      style: GoogleFonts.acme(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#C0C0BE"),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Icon(
                      Icons.remove_red_eye,
                      color: HexColor("#C0C0BE"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
