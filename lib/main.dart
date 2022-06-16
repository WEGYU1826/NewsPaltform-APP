// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
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
import 'package:zena/Test/test_2.dart';
import 'package:zena/Test/test_3.dart';
import 'package:zena/Test/test_4.dart';
import 'package:zena/Test/test_5.dart';
import 'package:zena/provider/NewsContent.dart';
import 'Screen/Authentication/LogInScreen.dart';
import 'Screen/Authentication/PrefrenceScreen.dart';
import 'Screen/Authentication/SignUpScreen.dart';
import 'Screen/Channel&Account/AccountPage.dart';
import 'Screen/Channel&Account/ChannelPage.dart';
import 'Screen/Onboarding/OnboardingScreen .dart';
import 'Screen/ServicePage/HomePage.dart';
import 'Test/test.dart';
import 'ThemeData/theme_data.dart';
import 'ThemeData/theme_preference.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'Light & Dark Theme';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeProvider _themeProvider = ThemeProvider();

  void getCurrentAppTheme() async {
    _themeProvider.darkTheme =
        await _themeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return provider.ChangeNotifierProvider<ThemeProvider>(
      create: (_) {
        print("${_themeProvider.darkTheme}  Hello");
        return _themeProvider;
      },
      child: provider.Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MultiProvider(
            providers: [ChangeNotifierProvider(create: (_) => RemoteService())],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeStyle.themeData(_themeProvider.darkTheme, context),
              // theme: ThemeData.light(),
              initialRoute: OnboardingPage.id,
              routes: {
                OnboardingPage.id: (context) => OnboardingPage(),
                LoginPage.id: (context) => LoginPage(),
                SignUpPage.id: (context) => SignUpPage(),
                PreferencePage.id: (context) => PreferencePage(),
                HomePage.id: (context) => HomePage(),
                MainPage.id: (context) => MainPage(),
                ProviderTest.id: (context) => ProviderTest(),
                ProviderTestChannel.id: (context) => ProviderTestChannel(),
                TestPage.id: (context) => TestPage(),
                SelectTest.id: (context) => SelectTest(),
                Test.id: (context) => Test(),
                SettingPage.id: (context) => SettingPage(),
                SearchPage.id: (context) => SearchPage(),
                AccountPage.id: (context) => AccountPage(),
                ChannelPage.id: (context) => ChannelPage(),
                PersonalInfoPage.id: (context) => PersonalInfoPage(),
                ChangePreferancePage.id: (context) => ChangePreferancePage(),
                MegazinPage.id: (context) => MegazinPage(),
                ChannelListAccordingToType.id: (context) =>
                    ChannelListAccordingToType(),
                EditName.id: (context) => EditName(),
                EditEmail.id: (context) => EditEmail(),
                EditPassword.id: (context) => EditPassword(),
                EditDisplay.id: (context) => EditDisplay(),
              },
            ),
          );
        },
      ),
    );
  }
}
