// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zena/Screen/Authentication/LogInScreen.dart';
import 'package:zena/Screen/Onboarding/DotIndicator.dart';
import 'package:zena/Screen/ServicePage/HomePage.dart';
import 'package:zena/Screen/ServicePage/MainPage.dart';
import 'package:zena/module/OnboardingPageContent.dart';

import '../../ThemeData/theme_preference.dart';
import 'OnboardingStructure.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key? key}) : super(key: key);
  static const String id = "onboarding_page";

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
    checkLogin();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void checkLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? val = await sharedPreferences.getString("token");

    if (val != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainPage()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return newMethod(context);
  }

  Widget newMethod(BuildContext context) {
    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: _themeProvider.darkTheme
                    ? onboardingDataDark.length
                    : onboardingDataLight.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardingStructure(
                  logoImage: _themeProvider.darkTheme
                      ? onboardingDataDark[index].logoURL
                      : onboardingDataLight[index].logoURL,
                  imageURL: _themeProvider.darkTheme
                      ? onboardingDataDark[index].imageURL
                      : onboardingDataLight[index].imageURL,
                  heading: _themeProvider.darkTheme
                      ? onboardingDataDark[index].heading
                      : onboardingDataLight[index].heading,
                  subHeading: _themeProvider.darkTheme
                      ? onboardingDataDark[index].subHeading
                      : onboardingDataLight[index].subHeading,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180.0, bottom: 20.0),
              child: Row(
                children: [
                  ...List.generate(
                    _themeProvider.darkTheme
                        ? onboardingDataDark.length
                        : onboardingDataLight.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(
                        right: 8.0,
                      ),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
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
                    Navigator.pushNamed(context, LoginPage.id);
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
      ),
    );
  }
}
