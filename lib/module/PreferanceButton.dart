import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screen/ServicePage/MainPage.dart';

class PreferanceButton extends StatefulWidget {
  Color? color;
  String? string;
  int? selectedItemNum;
  PreferanceButton({
    Key? key,
    required this.color,
    required this.string,
    required this.selectedItemNum,
  }) : super(key: key);

  @override
  State<PreferanceButton> createState() => _PreferanceButtonState();
}

class _PreferanceButtonState extends State<PreferanceButton> {
  @override
  Widget build(BuildContext context) {
    return preferanceButton(
        context, widget.color, widget.string, widget.selectedItemNum);
  }

  Widget preferanceButton(context, color, string, selectedItemNum) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
      child: Material(
        color: color,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            selectedItemNum >= 3
                ? Navigator.pushNamed(context, MainPage.id)
                : null;
          },
          height: 42.0,
          minWidth: 200.0,
          child: Text(
            string,
            style: GoogleFonts.acme(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
