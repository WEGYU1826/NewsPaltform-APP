// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zena/Screen/Authentication/LogInScreen.dart';
import 'package:zena/Screen/Onboarding/DotIndicator.dart';
import 'package:zena/module/OnboardingPageContent.dart';

import 'OnboardingStructure.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
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
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: onboardingData.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardingStructure(
                  logoImage: onboardingData[index].logoURL,
                  imageURL: onboardingData[index].imageURL,
                  heading: onboardingData[index].heading,
                  subHeading: onboardingData[index].subHeading,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180.0, bottom: 20.0),
              child: Row(
                children: [
                  ...List.generate(
                    onboardingData.length,
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
