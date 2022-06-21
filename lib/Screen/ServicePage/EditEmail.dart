// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/Screen/ServicePage/BuildTextFild.dart';
import 'package:zena/module/BuildSliverAppBar.dart';

import '../../module/ServicePageConst.dart';

class EditEmail extends StatefulWidget {
  const EditEmail({Key? key}) : super(key: key);
  static const String id = "edit_email";

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  bool showSpinner = false;
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: HexColor("#E5E5E5"),
      body: CustomScrollView(
        slivers: [
          BuilSliverAppBar(title: "Edit Email"),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          EditText(name: "Email"),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          BuildTextFild(hintText: "Email", textValue: email),
        ],
      ),
    );
  }
}
