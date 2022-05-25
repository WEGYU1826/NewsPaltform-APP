import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/Screen/Channel&Account/MegazinPage.dart';

import 'BuildDialogBox.dart';

class MegazinListBuild extends StatefulWidget {
  List? list;
  MegazinListBuild({
    Key? key,
    required this.list,
  }) : super(key: key);
  static const String id = "megazin_list_build";

  @override
  State<MegazinListBuild> createState() => _MegazinListBuildState();
}

class _MegazinListBuildState extends State<MegazinListBuild> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        primary: false,
        shrinkWrap: true,
        itemCount: widget.list!.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              BuildDialogBox(
                  index: index, list: widget.list, id: MegazinPage.id),
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
                      widget.list![index].imagURL!,
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
                    widget.list![index].downSize!,
                    style: GoogleFonts.acme(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  const SizedBox(width: 200.0),
                  Text(
                    widget.list![index].numbers!,
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
}
