// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BuildTextFildPassword extends StatefulWidget {
  BuildTextFildPassword({Key? key, required this.hintText}) : super(key: key);
  String? value;
  String? hintText;

  @override
  State<BuildTextFildPassword> createState() => _BuildTextFildPasswordState();
}

class _BuildTextFildPasswordState extends State<BuildTextFildPassword> {
  String? _value;
  bool hidePassword = false;
  @override
  Widget build(BuildContext context) {
    return buildTextFild(context, widget.hintText!);
  }

  Widget buildTextFild(context, String hintText) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          obscureText: hidePassword,
          // textAlign: TextAlign.center,
          onChanged: (value) {
            _value = value;
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              color: HexColor("#2E92EE").withOpacity(0.7),
              icon:
                  Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
            ),
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(color: HexColor("#2E92EE"), width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(color: HexColor("#2E92EE"), width: 3.0),
            ),
          ),
        ),
      ),
    );
  }
}
