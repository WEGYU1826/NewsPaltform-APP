import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeStyle {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    ThemeData _light = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
          elevation: 1.0,
          iconTheme: IconThemeData(color: Colors.white),
          color: Colors.white),
      primaryIconTheme: const IconThemeData(
        color: Colors.black,
      ),
      accentIconTheme: IconThemeData(
        color: Colors.grey[800],
      ),
      primaryColor: HexColor("#0E0E0E"),
      accentColor: HexColor("#E5E5E5"),

      brightness: Brightness.light,
      tabBarTheme: const TabBarTheme(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.orange),
          ),
        ),
      ),

      textTheme: TextTheme(
          bodyText1: GoogleFonts.acme(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          bodyText2: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          headline1: const TextStyle(
            fontSize: 96,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headline2: const TextStyle(
            fontSize: 60,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          headline4: GoogleFonts.acme(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 34,
              letterSpacing: 0.25),
          headline5: GoogleFonts.acme(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          headline6: GoogleFonts.acme(
            color: Colors.black,
            fontSize: 20,
            letterSpacing: 0.15,
            fontWeight: FontWeight.w400,
          ),
          subtitle1: GoogleFonts.acme(
            fontSize: 16,
            color: Colors.grey,
          ),
          subtitle2: GoogleFonts.acme(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          caption: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.black,
              letterSpacing: 0.4),
          button: const TextStyle(color: Colors.black)),

      // primarySwatch: Colors.red,

      backgroundColor: const Color(0xffF1F5FB),

      indicatorColor: const Color(0xffCBDCF8),
      buttonColor: const Color(0xffF1F5FB),

      highlightColor: const Color(0xffFCE192),
      hoverColor: const Color(0xff4285F4),

      focusColor: const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: Colors.white,
      canvasColor: Colors.grey[50],
      buttonTheme: Theme.of(context)
          .buttonTheme
          .copyWith(colorScheme: const ColorScheme.light()),

      // primarySwatch: Colors.orange,
    );
    ThemeData _dark = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xff393E46),
      appBarTheme: const AppBarTheme(
        elevation: 1.0,
        iconTheme: IconThemeData(color: Colors.white),
        color: Colors.black,
      ),
      accentColor: HexColor("#22231B"),
      primaryColor: HexColor("#FEFEFE"),
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      primaryIconTheme: const IconThemeData(
        color: Colors.white,
      ),
      accentIconTheme: const IconThemeData(
        color: Colors.white,
      ),
      tabBarTheme: const TabBarTheme(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.orange),
          ),
        ),
      ),
      cardColor: Colors.black,
      textTheme: TextTheme(
        bodyText1: GoogleFonts.acme(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        bodyText2: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        headline1: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headline2: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        headline4: GoogleFonts.acme(
          fontWeight: FontWeight.w600,
          fontSize: 34,
        ),
        headline5: GoogleFonts.acme(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        subtitle1: GoogleFonts.acme(
          color: Colors.grey,
          fontSize: 16,
        ),
        subtitle2: GoogleFonts.acme(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        headline6: GoogleFonts.acme(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        caption: GoogleFonts.acme(
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
      // bottomAppBarColor: Colors.black87,
    );
    print(isDarkTheme ? "dark theme" : "light theme");
    return isDarkTheme ? _dark : _light;
  }

  getCurrentNavigationBarColor(isDarkTheme) {
    if (isDarkTheme) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Color(0xFF26242e),
            systemNavigationBarIconBrightness: Brightness.light),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Color(0xFFFFFFFF),
            systemNavigationBarIconBrightness: Brightness.dark),
      );
    }
  }
}
