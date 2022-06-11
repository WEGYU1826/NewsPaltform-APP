// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;
  bool showSpinner = false;
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final ThemeProvider _themeProvider = ThemeProvider();
    return Scaffold(
      key: _scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    authLogo(_themeProvider.darkTheme),
                    authDescription(
                        "Join us on a Journey to the Information Era"),
                    const SizedBox(height: 40.0),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[A-Z a-z ,.\-]+$').hasMatch(value)) {
                          return "Please Enter Your Full Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline_outlined),
                        prefixIconColor: HexColor("#2E92EE"),
                        hintText: "Name",
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          borderSide: BorderSide(
                              color: HexColor("#2E92EE"), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          borderSide: BorderSide(
                              color: HexColor("#2E92EE"), width: 3.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}')
                                .hasMatch(value)) {
                          return "Please Enter the Correct Email";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        prefixIconColor: HexColor("#2E92EE"),
                        hintText: "Email",
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          borderSide: BorderSide(
                              color: HexColor("#2E92EE"), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          borderSide: BorderSide(
                              color: HexColor("#2E92EE"), width: 3.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: hidePassword,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[A-Za-z0-9!@#$%*+-/~?<>].{8,20}$')
                                .hasMatch(value)) {
                          return "Please Enter 8 or more char";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        prefixIconColor: HexColor("#2E92EE"),
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          color: HexColor("#2E92EE").withOpacity(0.7),
                          icon: Icon(hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          borderSide: BorderSide(
                              color: HexColor("#2E92EE"), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          borderSide: BorderSide(
                              color: HexColor("#2E92EE"), width: 3.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: hidePassword,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[A-Za-z0-9!@#$%*+-/~?<>].{8,20}$')
                                .hasMatch(value)) {
                          return "Please Enter 8 or more char";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        prefixIconColor: HexColor("#2E92EE"),
                        hintText: "Confirm Password",
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          borderSide: BorderSide(
                              color: HexColor("#2E92EE"), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          borderSide: BorderSide(
                              color: HexColor("#2E92EE"), width: 3.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    SizedBox(
                      height: 45.0,
                      width: 150.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, PreferencePage.id);
                          if (formKey.currentState!.validate()) {
                            final snackBar = SnackBar(
                              content: Text("Submitting Form"),
                            );
                            _scaffoldKey.currentState!.showSnackBar(snackBar);
                          }
                        },
                        child: Text(
                          "Sign Up",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.acme(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: HexColor("#FEFEFE"),
                          ),
                        ),
                      ),
                    ),
                    const OtherAuthBuild(),
                    RichTextBuild(
                      id: LoginPage.id,
                      spanText: "Already have an account? ",
                      richText: " Login",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
