// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:zena/Screen/ServicePage/BuildTextFildPasword.dart';

import '../../module/BuildSliverAppBar.dart';
import '../../module/ServicePageConst.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({Key? key}) : super(key: key);
  static const String id = "edit_password";

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  String? password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: HexColor("#E5E5E5"),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: CustomScrollView(
          slivers: [
            BuilSliverAppBar(title: 'Edit Password'),
            const SliverToBoxAdapter(
              child: SizedBox(height: 15.0),
            ),
            EditText(name: "Old Password"),
            const SliverToBoxAdapter(
              child: SizedBox(height: 15.0),
            ),
            BuildTextFildPassword(
                hintText: "Old Password", textValue: password),
            const SliverToBoxAdapter(
              child: SizedBox(height: 15.0),
            ),
            EditText(name: "New Password"),
            const SliverToBoxAdapter(
              child: SizedBox(height: 15.0),
            ),
            BuildTextFildPassword(
                hintText: "New Password", textValue: password),
            const SliverToBoxAdapter(
              child: SizedBox(height: 15.0),
            ),
            EditText(name: "Confirm Password"),
            const SliverToBoxAdapter(
              child: SizedBox(height: 15.0),
            ),
            BuildTextFildPassword(
                hintText: "Confirm Password", textValue: password),
          ],
        ),
      ),
    );
  }
}
