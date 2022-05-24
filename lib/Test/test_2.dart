import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:zena/main.dart';

class SelectTest extends StatefulWidget {
  const SelectTest({Key? key}) : super(key: key);
  static const String id = "selected_page";

  @override
  State<SelectTest> createState() => _SelectTestState();
}

class _SelectTestState extends State<SelectTest> {
  final controller = DragSelectGridViewController();

  @override
  void initState() {
    super.initState();
    controller.addListener(rebuild);
  }

  @override
  void dispose() {
    controller.removeListener(rebuild);
    super.dispose();
  }

  void rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final isSelected = controller.value.isSelecting;
    final text =
        isSelected ? '${controller.value.amount} Image Selected' : MyApp.title;

    return Scaffold(
      appBar: AppBar(
        title: Text(text),
        leading: isSelected ? const CloseButton() : Container(),
        actions: [
          if (isSelected)
            IconButton(
              onPressed: () {
                final imageSelected = controller.value.selectedIndexes
                    .map<String>((index) => imageList[index].imageURL!)
                    .toList();

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ImagePage(
                    imagesURL: imageSelected,
                  ),
                ));
              },
              icon: const Icon(Icons.done),
            ),
        ],
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: DragSelectGridView(
        gridController: controller,
        padding: const EdgeInsets.all(8.0),
        itemCount: imageList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index, selected) => SelectableItemWidget(
          url: imageList[index].imageURL,
          isSelected: selected,
        ),
      ),
    );
  }
}

class SelectableItemWidget extends StatefulWidget {
  final String? url;
  final bool? isSelected;

  const SelectableItemWidget({
    Key? key,
    required this.url,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<SelectableItemWidget> createState() => _SelectableItemWidgetState();
}

class _SelectableItemWidgetState extends State<SelectableItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      value: widget.isSelected! ? 1 : 0,
      duration: kThemeChangeDuration,
      vsync: this,
    );

    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.ease,
    ));
  }

  @override
  void didUpdateWidget(SelectableItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected!) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: scaleAnimation.value,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.isSelected! ? 80 : 20),
            child: child,
          ),
        ),
        child: Image.asset(widget.url!, fit: BoxFit.cover),
      );
}

class ImagePage extends StatelessWidget {
  final List<String>? imagesURL;
  const ImagePage({
    Key? key,
    required this.imagesURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: const Text('Selected Images'),
          centerTitle: true,
        ),
        body: ListView(
          children: imagesURL!
              .map(
                (urlImage) => Image.asset(
                  urlImage,
                  fit: BoxFit.cover,
                  height: 300,
                ),
              )
              .toList(),
        ),
      );
}

class ImageURL {
  String? imageURL;

  ImageURL({
    this.imageURL,
  });
}

List<ImageURL> imageList = [
  ImageURL(
    imageURL: "assets/images/test/1.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/2.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/3.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/4.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/5.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/6.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/7.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/8.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/9.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/10.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/11.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/12.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/13.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/14.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/15.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/16.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/17.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/18.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/19.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/20.jpg",
  ),
  ImageURL(
    imageURL: "assets/images/test/11.jpg",
  ),
];
