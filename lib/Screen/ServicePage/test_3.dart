import 'dart:collection';

import 'package:flutter/material.dart';

class GridViewTest extends StatefulWidget {
  const GridViewTest({Key? key}) : super(key: key);
  static const String id = "rrid_view_test";

  @override
  State<GridViewTest> createState() => _GridViewTestState();
}

class _GridViewTestState extends State<GridViewTest> {
  List<String> imagePaths = [
    "assets/images/test/1.jpg",
    "assets/images/test/2.jpg",
    "assets/images/test/3.jpg",
    "assets/images/test/4.jpg",
    "assets/images/test/5.jpg",
    "assets/images/test/6.jpg",
    "assets/images/test/7.jpg",
    "assets/images/test/8.jpg",
  ];
  HashSet selectedItem = HashSet();
  bool isMultiSelectedEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: isMultiSelectedEnable
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isMultiSelectedEnable = false;
                    selectedItem.clear();
                  });
                },
                icon: const Icon(Icons.close))
            : null,
        title: Text(isMultiSelectedEnable
            ? getHeaderCountText()
            : "GridView Multi Selector"),
        centerTitle: true,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.5,
        children: imagePaths.map((String path) {
          return getGridView(path);
        }).toList(),
      ),
    );
  }

  String getHeaderCountText() {
    return selectedItem.isNotEmpty
        ? selectedItem.length.toString() + "item selected"
        : "No item selected";
  }

  void doMultiSelected(String path) {
    if (isMultiSelectedEnable) {
      setState(() {
        if (selectedItem.contains(path)) {
          selectedItem.remove(path);
        } else {
          selectedItem.add(path);
        }
      });
    } else {}
  }

  GridTile getGridView(String path) {
    return GridTile(
      child: InkWell(
        onTap: () {
          doMultiSelected(path);
        },
        onDoubleTap: () {
          if (!isMultiSelectedEnable) {
            isMultiSelectedEnable = true;
          }
        },
        child: Stack(
          children: [
            Image.asset(
              path,
              width: MediaQuery.of(context).size.width / 2,
              height: 250.0,
              fit: BoxFit.cover,
              color:
                  Colors.black.withOpacity(selectedItem.contains(path) ? 1 : 0),
              colorBlendMode: BlendMode.color,
            ),
            Visibility(
              visible: selectedItem.contains(path),
              child: const Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
