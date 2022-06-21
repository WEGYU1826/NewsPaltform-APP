// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:zena/Screen/Channel&Account/ChannelPage.dart';
import 'package:zena/Screen/ServicePage/ChannelListPage.dart';
import 'package:zena/Screen/ServicePage/ChannelPage.dart';
import 'package:zena/Screen/ServicePage/HomePage.dart';
import 'package:zena/Screen/ServicePage/SearchPage.dart';

import '../../module/BottomNavigation.dart';
import '../Channel&Account/AccountPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String id = "main_page";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  void onChagedTab(int index) {
    setState(() {
      this.index = index;
    });
  }

  final page = <Widget>[
    const HomePage(),
    const ChannelPageWithCatagories(),
    const SearchPage(),
    const AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: page[index],
      bottomNavigationBar: BottomNavigation(
        index: index,
        onChangedTab: onChagedTab,
      ),
    );
  }
}
