// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../module/BuildSliverAppBar.dart';
import '../../module/ServicePageConst.dart';
import 'BuildTextFild.dart';

class EditName extends StatefulWidget {
  const EditName({Key? key}) : super(key: key);
  static const String id = "edit_name";

  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  bool showSpinner = false;
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#E5E5E5"),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: CustomScrollView(
          slivers: [
            BuilSliverAppBar(title: 'Edit Name'),
            const SliverToBoxAdapter(
              child: SizedBox(height: 15.0),
            ),
            EditText(name: "Name"),
            const SliverToBoxAdapter(
              child: SizedBox(height: 15.0),
            ),
            BuildTextFild(hintText: "Name"),
          ],
        ),
      ),
    );
  }
}
