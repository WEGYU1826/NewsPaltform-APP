// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomNavigation extends StatefulWidget {
  final int? index;
  final ValueChanged<int>? onChangedTab;

  const BottomNavigation({Key? key, this.index, this.onChangedTab})
      : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(
            index: 0,
            icon: const Icon(Icons.home_outlined),
          ),
          buildTabItem(
            index: 1,
            icon: const Icon(FontAwesomeIcons.earthAfrica),
          ),
          buildTabItem(
            index: 2,
            icon: const Icon(Icons.grid_view_outlined),
          ),
          buildTabItem(
            index: 3,
            icon: const Icon(Icons.search),
          ),
          buildTabItem(
            index: 4,
            icon: const Icon(FontAwesomeIcons.user),
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({required int? index, required Icon? icon}) {
    final isSelected = index == widget.index;
    return IconTheme(
      data: IconThemeData(
        color:
            isSelected ? HexColor("#2E92EE") : Theme.of(context).primaryColor,
      ),
      child: IconButton(
        onPressed: () => widget.onChangedTab!(index!),
        icon: icon!,
      ),
    );
  }
}
