import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AuthButtonBuild extends StatefulWidget {
  String? id;
  String? buttonText;
  AuthButtonBuild({
    Key? key,
    required this.id,
    required this.buttonText,
  }) : super(key: key);

  @override
  State<AuthButtonBuild> createState() => _AuthButtonBuildState();
}

class _AuthButtonBuildState extends State<AuthButtonBuild> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: HexColor("#2E92EE"),
        elevation: 10.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, widget.id!);
          },
          height: 42.0,
          minWidth: 200.0,
          child: Text(
            widget.buttonText!,
            style: GoogleFonts.acme(
              color: Theme.of(context).primaryColor,
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
