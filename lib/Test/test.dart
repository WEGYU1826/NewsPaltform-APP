import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);
  static const String id = "test_page";

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.deepPurple[900],
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
            ],
            title: const Center(
              child: Text("Silver App Bar"),
            ),
            expandedHeight: 200.0,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.pink,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 400.0,
                  color: Colors.deepPurple[300],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 400.0,
                  color: Colors.deepPurple[300],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 400.0,
                  color: Colors.deepPurple[300],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 400.0,
                  color: Colors.deepPurple[300],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//  BottomNavigationBar(
//         currentIndex: _currentTab,
//         onTap: (int value) {
//           setState(() {
//             _currentTab = value;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               FontAwesomeIcons.house,
//               size: 20.0,
//               color: HexColor("#0E0E0E"),
//             ),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               FontAwesomeIcons.globe,
//               size: 20.0,
//               color: HexColor("#0E0E0E"),
//             ),
//             label: "Global News",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               FontAwesomeIcons.grip,
//               size: 20.0,
//               color: HexColor("#0E0E0E"),
//             ),
//             label: "Grid",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               FontAwesomeIcons.searchengin,
//               size: 20.0,
//               color: HexColor("#0E0E0E"),
//             ),
//             label: "Search",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               FontAwesomeIcons.userGroup,
//               size: 20.0,
//               color: HexColor("#0E0E0E"),
//             ),
//             label: "User",
//           ),
//         ],
//       ),
