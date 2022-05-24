import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class PasswordTextField extends StatefulWidget {
  String? hintText;
  String? password;
  PasswordTextField({Key? key, required this.hintText, required this.password})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hidePassword,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      onChanged: (value) {
        widget.password = value;
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          color: HexColor("#2E92EE").withOpacity(0.7),
          icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
        ),
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
