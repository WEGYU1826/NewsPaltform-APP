import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomNaigation extends StatefulWidget {
  const BottomNaigation({Key? key}) : super(key: key);

  @override
  State<BottomNaigation> createState() => _BottomNaigationState();
}

class _BottomNaigationState extends State<BottomNaigation> {
  int _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  BottomNavigationBar BottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _currentTab,
      onTap: (int value) {
        setState(() {
          _currentTab = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.house,
              size: 20.0,
              color: HexColor("#0E0E0E"),
            ),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.globe,
              size: 20.0,
              color: HexColor("#0E0E0E"),
            ),
          ),
          label: "Global News",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.grip,
              size: 20.0,
              color: HexColor("#0E0E0E"),
            ),
          ),
          label: "Grid",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.searchengin,
              size: 20.0,
              color: HexColor("#0E0E0E"),
            ),
          ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.userGroup,
              size: 20.0,
              color: HexColor("#0E0E0E"),
            ),
          ),
          label: "User",
        ),
      ],
    );
  }
}
