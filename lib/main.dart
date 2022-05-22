import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zena/Screen/Channel&Account/MegazinPage.dart';
import 'package:zena/Screen/ServicePage/ChangePreferancePage.dart';
import 'package:zena/Screen/ServicePage/ChannelListPage.dart';
import 'package:zena/Screen/ServicePage/EditDisplay.dart';
import 'package:zena/Screen/ServicePage/EditEmail.dart';
import 'package:zena/Screen/ServicePage/EditName.dart';
import 'package:zena/Screen/ServicePage/EditPassword.dart';
import 'package:zena/Screen/ServicePage/MainPage.dart';
import 'package:zena/Screen/ServicePage/PersonalInfoPage.dart';
import 'package:zena/Screen/ServicePage/SearchPage.dart';
import 'package:zena/Screen/ServicePage/SettingPage.dart';
import 'package:zena/Screen/ServicePage/test.dart';
import 'package:zena/Screen/ServicePage/test_2.dart';
import 'package:zena/Screen/ServicePage/test_3.dart';
import 'Screen/Authentication/LogInScreen.dart';
import 'Screen/Authentication/PrefrenceScreen.dart';
import 'Screen/Authentication/SignUpScreen.dart';
import 'Screen/Channel&Account/AccountPage.dart';
import 'Screen/Channel&Account/ChannelPage.dart';
import 'Screen/Onboarding/OnboardingScreen .dart';
import 'Screen/ServicePage/HomePage.dart';

// #EEEFEA
// #FF0000
// #2E92EE button

void main() {
  runApp(const MyApp());
}

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'Select & Drag GridView';

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primaryColorLight: HexColor("#FEFEFE"),
        accentColor: HexColor("#EEEFEA"),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: HexColor("#0E0E0E"),
        accentColor: HexColor("#22231B"),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: theme,
        darkTheme: darkTheme,
        initialRoute: OnboardingPage.id,
        routes: {
          OnboardingPage.id: (context) => const OnboardingPage(),
          LoginPage.id: (context) => const LoginPage(),
          SignUpPage.id: (context) => const SignUpPage(),
          PreferencePage.id: (context) => const PreferencePage(),
          HomePage.id: (context) => const HomePage(),
          MainPage.id: (context) => const MainPage(),
          TestPage.id: (context) => const TestPage(),
          SelectTest.id: (context) => const SelectTest(),
          GridViewTest.id: (context) => const GridViewTest(),
          SettingPage.id: (context) => const SettingPage(),
          SearchPage.id: (context) => const SearchPage(),
          AccountPage.id: (context) => const AccountPage(),
          ChannelPage.id: (context) => const ChannelPage(),
          PersonalInfoPage.id: (context) => const PersonalInfoPage(),
          ChangePreferancePage.id: (context) => const ChangePreferancePage(),
          MegazinPage.id: (context) => const MegazinPage(),
          ChannelListAccordingToType.id: (context) =>
              const ChannelListAccordingToType(),
          EditName.id: (context) => const EditName(),
          EditEmail.id: (context) => const EditEmail(),
          EditPassword.id: (context) => const EditPassword(),
          EditDisplay.id: (context) => const EditDisplay(),
        },
      ),
    );
  }
}
