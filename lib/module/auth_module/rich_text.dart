import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class RichTextBuild extends StatefulWidget {
  String? id;
  String? spanText;
  String? richText;
  RichTextBuild({
    Key? key,
    required this.id,
    required this.spanText,
    required this.richText,
  }) : super(key: key);

  @override
  State<RichTextBuild> createState() => _RichTextBuildState();
}

class _RichTextBuildState extends State<RichTextBuild> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.acme(
            color: Colors.grey,
            fontSize: 14.0,
          ),
          children: <TextSpan>[
            TextSpan(text: widget.spanText),
            TextSpan(
              text: widget.richText,
              style: GoogleFonts.acme(
                  color: HexColor("#2E92EE"),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                  // decoration: TextDecoration.underline,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, widget.id!);
                },
            ),
          ],
        ),
      ),
    );
  }
}
