// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zena/Screen/ServicePage/HomePage.dart';
import 'package:zena/Screen/ServicePage/MainPage.dart';

class AuthController extends Model {
  bool _loadingUser = false;

  bool get loadingUser {
    return _loadingUser;
  }

  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  Future loginUser(BuildContext context) async {
    _loadingUser = true;
    try {
      const url = 'https://zena-api-dev.herokuapp.com/api/v1/customers/login';
      var response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "email": emailFieldController.text,
            "password": passwordFieldController.text,
          }));
      if (response.statusCode == 200) {
        var loginArr = json.decode(response.body);
        pageRoute(context, loginArr['token'], loginArr['email']);
        print(loginArr['token']);

        _loadingUser = false;
      } else {
        _loadingUser = false;
        print(response.body);
      }
    } on Exception catch (e) {
      _loadingUser = false;
      print(e);
    }
  }

  void pageRoute(BuildContext context, String token, String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("token", token);
    // await sharedPreferences.setString("email", email);
    String? val = sharedPreferences.getString("token");
    print("This:" + val!);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MainPage()), (route) => false);
  }
}
