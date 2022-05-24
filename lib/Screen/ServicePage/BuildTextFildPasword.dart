// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BuildTextFildPassword extends StatefulWidget {
  String? textValue;
  String? hintText;
  BuildTextFildPassword({
    Key? key,
    required this.hintText,
    required this.textValue,
  }) : super(key: key);

  @override
  State<BuildTextFildPassword> createState() => _BuildTextFildPasswordState();
}

class _BuildTextFildPasswordState extends State<BuildTextFildPassword> {
  bool hidePassword = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          obscureText: hidePassword,
          // textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          onChanged: (value) {
            widget.textValue = value;
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
            hintText: widget.hintText,
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
