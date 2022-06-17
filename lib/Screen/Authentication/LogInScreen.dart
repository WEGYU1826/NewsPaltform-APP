// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:zena/Screen/Authentication/SignUpScreen.dart';
import 'package:zena/module/auth_module/other_auth.dart';
import 'package:zena/module/auth_module/rich_text.dart';

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
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool hidePassword = true;
  bool showSpinner = false;
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
                        "Login to Get Your Personalized News Daily"),
                    const SizedBox(height: 40.0),
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
                          return "Please enter the correct email";
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
                    const SizedBox(height: 10.0),
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
                          Navigator.pushNamed(context, MainPage.id);
                          if (formKey.currentState!.validate()) {
                            final snackBar = SnackBar(
                              content: Text("Submitting Form"),
                            );
                            _scaffoldKey.currentState!.showSnackBar(snackBar);
                          }
                        },
                        child: Text(
                          "Login",
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
                      id: SignUpPage.id,
                      spanText: "Don't have an account? ",
                      richText: " Sign Up",
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
