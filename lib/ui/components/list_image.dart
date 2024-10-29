import 'dart:ui';

import 'package:animated_image_list/AnimatedImageList.dart';
import 'package:flutter/material.dart';
import 'package:loung_bar/data/list_image.dart';

class ListImage extends StatefulWidget {
  const ListImage({super.key, required this.isMobileUi});
  final bool isMobileUi;
  @override
  State<ListImage> createState() => _ListImageState();
}

class _ListImageState extends State<ListImage> {
  late PageController pageController;
  double? pageOffset = 0;
  @override
  void initState() {
    super.initState();
    if (widget.isMobileUi) {
      pageController = PageController(viewportFraction: 0.6);
    } else {
      pageController = PageController(viewportFraction: 0.3);
    }
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: AnimatedImageList(
          scrollDirection: Axis.horizontal,
          images: listImage.map((e) => e['image'].toString()).toList(),
          builder: (context, index, progress) {
            return Positioned.directional(
                textDirection: TextDirection.ltr,
                bottom: 15,
                start: 25,
                child: Opacity(
                  opacity: progress > 1 ? (2 - progress) : progress,
                  child: Text(
                    listImage[index]['name'] ?? "",
                    style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ));
          },
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
