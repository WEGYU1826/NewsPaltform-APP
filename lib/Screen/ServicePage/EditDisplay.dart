// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/module/contConst.dart';

import '../../module/BuildSliverAppBar.dart';
import '../../module/ServicePageConst.dart';
import '../../module/ToBeSelectedCatagories.dart';

class EditDisplay extends StatefulWidget {
  const EditDisplay({Key? key}) : super(key: key);
  static const String id = "edit_display";

  @override
  State<EditDisplay> createState() => _EditDisplayState();
}

class _EditDisplayState extends State<EditDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#E5E5E5"),
      body: CustomScrollView(
        slivers: [
          BuilSliverAppBar(title: "Edit Display"),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          EditText(name: "Select Your Prefer Display"),
          SliverToBoxAdapter(
            child: ToBeSelectedCatagories(selectedType: displayType),
          ),
        ],
      ),
    );
  }
}
