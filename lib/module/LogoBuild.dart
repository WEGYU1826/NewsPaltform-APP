// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/module/ServicePageConst.dart';

class LogoBuild extends StatelessWidget {
  const LogoBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 170),
            child: logoImage(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                // Icons.abc,
                FontAwesomeIcons.bars,
                color: HexColor("#0E0E0E"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
