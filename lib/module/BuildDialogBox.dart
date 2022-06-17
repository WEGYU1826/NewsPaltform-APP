// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zena/model/news_model.dart';

import 'DialogBox.dart';

class BuildDialogBox extends StatefulWidget {
  List<News>? list;
  int? index;
  String? id;
  BuildDialogBox({
    Key? key,
    required this.index,
    required this.list,
    required this.id,
  }) : super(key: key);

  @override
  State<BuildDialogBox> createState() => _BuildDialogBoxState();
}

class _BuildDialogBoxState extends State<BuildDialogBox> {
  @override
  Widget build(BuildContext context) {
    return buildLogoList(context, widget.list!, widget.index!, widget.id!);
  }

  Widget buildLogoList(context, list, index, String id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() {
            Navigator.pushNamed(context, id);
          }),
          child: CircleAvatar(
            radius: 15.0,
            backgroundColor: Theme.of(context).primaryColor,
            backgroundImage: NetworkImage(list[index].publisherChannel.logo),
          ),
        ),
        const SizedBox(width: 10.0),
        GestureDetector(
          onTap: () => setState(() {
            Navigator.pushNamed(context, id);
          }),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(list[index].name!,
                  // textAlign: TextAlign.start,
                  style: GoogleFonts.acme(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                list[index].time!,
                style: GoogleFonts.acme(
                    // color: HexColor("#C0C0BE"),
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 220.0),
        DialogBox(index: index, id: id),
      ],
    );
  }
}
