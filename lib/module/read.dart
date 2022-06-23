import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/model/news_model.dart';

class ReadContent extends StatefulWidget {
  String? title;
  String? name;
  String? poster;
  String? description;
  String? time;
  List<Author>? publisher;
  ReadContent({
    Key? key,
    required this.title,
    required this.name,
    required this.poster,
    required this.description,
    required this.time,
    required this.publisher,
  }) : super(key: key);

  @override
  State<ReadContent> createState() => _ReadContentState();
}

class _ReadContentState extends State<ReadContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.poster!,
            height: 350.0,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.name!,
              textAlign: TextAlign.start,
              style: GoogleFonts.acme(
                fontSize: 18.0,
                color: HexColor('#2E92EE'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.title!,
              style: GoogleFonts.acme(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.time! + " minites ago",
              style: GoogleFonts.acme(
                fontSize: 18.0,
                color: HexColor('#2E92EE'),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.description!,
              style: GoogleFonts.acme(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
