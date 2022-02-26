import 'package:flutter/material.dart';
import 'package:web_app/desktop/tiles_desktop.dart';
import 'package:web_app/mobile/tiles_mobile.dart';
import 'package:web_app/responsive/responsive.dart';

class FeaturedTiles extends StatelessWidget {

  final Size screenSize;
  FeaturedTiles({Key? key, required this.screenSize}) : super(key: key);

  final List<String> assets = [
    "assets/images/test1.jpeg",
    "assets/images/test2.jpeg",
    "assets/images/test3.jpeg",
  ];

  final List<String> title = ["Sci-fi", "Photography", "Romance"];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context) ? TilesMobile(screenSize: screenSize) : TilesDesktop(screenSize: screenSize);
  }
}