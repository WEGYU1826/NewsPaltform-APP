// ignore_for_file: file_names, avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zena/Screen/Authentication/SignUpScreen.dart';
import 'package:zena/module/auth_module/other_auth.dart';
import 'package:zena/module/auth_module/rich_text.dart';
import 'package:zena/provider/Auth/auth_controller.dart';
// import 'package:zena/provider/Auth/login.dart';
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
  bool hidePassword = true;
  bool showSpinner = false;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    // getData();
  }

  void getData() async {
    String respons = await authController.loginUser(context);
    setState(() {
      if (respons.isNotEmpty) {
        isLoaded = false;
      }
    });
  }

  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final ThemeProvider _themeProvider = ThemeProvider();
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
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
                  authDescription("Login to Get Your Personalized News Daily"),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    controller: authController.emailFieldController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    onFieldSubmitted: (term) {},
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
                        borderSide:
                            BorderSide(color: HexColor("#2E92EE"), width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                        borderSide:
                            BorderSide(color: HexColor("#2E92EE"), width: 3.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: authController.passwordFieldController,
                    obscureText: hidePassword,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    onFieldSubmitted: (term) {},
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[A-Za-z0-9!@#$%*+-/~?<>].{7,20}$')
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
                        borderSide:
                            BorderSide(color: HexColor("#2E92EE"), width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                        borderSide:
                            BorderSide(color: HexColor("#2E92EE"), width: 3.0),
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
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          // ignore: prefer_const_constructors
                          final snackBar = SnackBar(
                            content: const Text("Submitting Form"),
                          );
                          _scaffoldKey.currentState!.showSnackBar(snackBar);
                        }
                        authController.loginUser(context);
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

                  // const OtherAuthBuild(),
                  // const SizedBox(height: 20.0),
                  // RichTextBuild(
                  //   id: SignUpPage.id,
                  //   spanText: "Don't have an account? ",
                  //   richText: " Sign Up",
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
