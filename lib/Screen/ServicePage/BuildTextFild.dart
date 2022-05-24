// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BuildTextFild extends StatefulWidget {
  String? textValue;
  String? hintText;
  BuildTextFild({
    Key? key,
    required this.hintText,
    required this.textValue,
  }) : super(key: key);

  @override
  State<BuildTextFild> createState() => _BuildTextFildState();
}

class _BuildTextFildState extends State<BuildTextFild> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          keyboardType: TextInputType.name,
          // textAlign: TextAlign.center,
          onChanged: (value) {
            widget.textValue = value;
          },
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Theme.of(context).primaryColor,
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
