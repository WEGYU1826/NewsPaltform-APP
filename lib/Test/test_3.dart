import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../ThemeData/theme_preference.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  static const String id = "test";
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 40.0, left: 20.0, right: 20.0),
            child: SizedBox(
              height: 50,
              width: 120,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  // _pageController.nextPage(
                  //     duration: const Duration(milliseconds: 300),
                  //     curve: Curves.ease);
                  // Navigator.pushNamed(context, LoginPage.id);

                  themeProvider.darkTheme = !themeProvider.darkTheme;
                  print(themeProvider.darkTheme);
                },
                child: Text(
                  "Get Started",
                  style: GoogleFonts.acme(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
