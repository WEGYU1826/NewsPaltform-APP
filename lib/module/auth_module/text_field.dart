import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TextFieldBuild extends StatefulWidget {
  String? hintText;
  String? textValue;
  Icon? icon;
  TextFieldBuild({
    Key? key,
    required this.hintText,
    required this.textValue,
    required this.icon,
  }) : super(key: key);

  @override
  State<TextFieldBuild> createState() => _TextFieldBuildState();
}

class _TextFieldBuildState extends State<TextFieldBuild> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      onChanged: (value) {
        widget.textValue = value;
      },
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        prefixIconColor: HexColor("#2E92EE"),
        hintText: widget.hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(32.0),
          ),
          borderSide: BorderSide(color: HexColor("#2E92EE"), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(32.0),
          ),
          borderSide: BorderSide(color: HexColor("#2E92EE"), width: 3.0),
        ),
      ),
    );
  }
}
