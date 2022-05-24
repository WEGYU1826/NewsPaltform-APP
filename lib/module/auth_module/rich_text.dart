import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
          children: <TextSpan>[
            TextSpan(text: widget.spanText),
            TextSpan(
              text: widget.richText,
              style: TextStyle(
                color: HexColor("#2E92EE"),
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
