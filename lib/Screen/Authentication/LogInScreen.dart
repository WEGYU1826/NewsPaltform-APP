// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:zena/Screen/Authentication/SignUpScreen.dart';
import 'package:zena/module/auth_module/auth_button.dart';
import 'package:zena/module/auth_module/other_auth.dart';
import 'package:zena/module/auth_module/password_text_field.dart';
import 'package:zena/module/auth_module/rich_text.dart';
import 'package:zena/module/auth_module/text_field.dart';

import '../../ThemeData/theme_preference.dart';
import '../../module/ServicePageConst.dart';
import '../ServicePage/MainPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String id = "login_scree";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool hidePassword = true;
  bool showSpinner = false;
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
                  authDescription("Login to Get Your Personalized News Daily"),
                  const SizedBox(height: 40.0),
                  TextFieldBuild(
                    hintText: "Email",
                    textValue: email,
                    icon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(height: 10.0),
                  PasswordTextField(hintText: "Password", password: password),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 17.0, top: 10.0),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Forget Password ?",
                              style: TextStyle(
                                color: HexColor("#2E92EE"),
                                // decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // ignore: avoid_print
                                  print("Forget Password");
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AuthButtonBuild(
                    id: MainPage.id,
                    buttonText: "Login",
                  ),
                  const OtherAuthBuild(),
                  RichTextBuild(
                    id: SignUpPage.id,
                    spanText: "Don't have an account? ",
                    richText: " Sign Up",
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
