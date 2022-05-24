// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:zena/Screen/Authentication/PrefrenceScreen.dart';
import 'package:zena/module/ServicePageConst.dart';
import 'package:zena/module/auth_module/auth_button.dart';
import 'package:zena/module/auth_module/other_auth.dart';
import 'package:zena/module/auth_module/password_text_field.dart';
import 'package:zena/module/auth_module/rich_text.dart';
import '../../ThemeData/theme_preference.dart';
import '../../module/auth_module/text_field.dart';
import 'LogInScreen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String id = "sigh_up_page";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? name;
  String? email;
  String? password;
  bool showSpinner = false;
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    final ThemeProvider _themeProvider = ThemeProvider();
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  authLogo(_themeProvider.darkTheme),
                  authDescription(
                      "Join us on a Journey to the Information Era"),
                  const SizedBox(height: 40.0),
                  TextFieldBuild(
                    hintText: "Name",
                    textValue: name,
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 10.0),
                  TextFieldBuild(
                    hintText: "Email",
                    textValue: email,
                    icon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(height: 10.0),
                  PasswordTextField(hintText: "Password", password: password),
                  const SizedBox(height: 10.0),
                  PasswordTextField(
                      hintText: "Confirm Password", password: password),
                  AuthButtonBuild(id: PreferencePage.id, buttonText: "Sigh Up"),
                  const OtherAuthBuild(),
                  RichTextBuild(
                    id: LoginPage.id,
                    spanText: "Already have an account? ",
                    richText: " Login",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
