// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/module/BuildSliverAppBar.dart';
import 'package:zena/module/contConst.dart';

import '../../module/ServicePageConst.dart';
import '../../module/ToBeSelectedCatagories.dart';

class ChangePreferancePage extends StatefulWidget {
  const ChangePreferancePage({Key? key}) : super(key: key);
  static const String id = "change_preferance";

  @override
  State<ChangePreferancePage> createState() => _ChangePreferancePageState();
}

class _ChangePreferancePageState extends State<ChangePreferancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: HexColor("#E5E5E5"),
      body: CustomScrollView(
        slivers: [
          BuilSliverAppBar(title: "Change Preferance"),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30.0),
          ),
          EditText(name: "Select 3 or more"),
          SliverToBoxAdapter(
            child: ToBeSelectedCatagories(selectedType: listOfPreferance),
          ),
        ],
      ),
    );
  }
}
