import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class OtherAuthBuild extends StatefulWidget {
  const OtherAuthBuild({Key? key}) : super(key: key);

  @override
  State<OtherAuthBuild> createState() => _OtherAuthBuildState();
}

class _OtherAuthBuildState extends State<OtherAuthBuild> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: Colors.white,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(30.0),
            child: MaterialButton(
              onPressed: () {},
              height: 40.0,
              minWidth: 40.0,
              child: Icon(
                FontAwesomeIcons.google,
                color: HexColor("#2E92EE"),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Material(
            color: Colors.white,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(30.0),
            child: MaterialButton(
              onPressed: () {},
              height: 40.0,
              minWidth: 40.0,
              child: Icon(
                FontAwesomeIcons.facebookF,
                color: HexColor("#2E92EE"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
