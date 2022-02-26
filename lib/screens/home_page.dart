import 'package:flutter/material.dart';
import 'package:web_app/widgets/featured_heading.dart';
import 'package:web_app/widgets/featured_tiles.dart';
import 'package:web_app/widgets/floating_quick_access_bar.dart';
import 'package:web_app/widgets/main_heading.dart';
import 'package:web_app/widgets/top_bar_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    _opacity = _scrollPosition < screenSize.height * 0.4 ? _scrollPosition / (screenSize.height * 0.4) : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 40, 50, 55),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: TopBarContent(opacity: _opacity),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
      
            Stack(
              children: [
                
                SizedBox(
                  width: screenSize.width,
                  height: screenSize.height * 0.54,
                  child: Image.asset(
                      "assets/images/cover.jpg",
                      fit: BoxFit.cover,
                  ),
                ),
      
                FloatingQuickAccessBar(screenSize: screenSize),
      
              ],
            ),
      
            FeaturedHeading(screenSize: screenSize),
      
            FeaturedTiles(screenSize: screenSize),

            MainHeading(screenSize: screenSize),
      
      
      
      
          ],
        ),
      ),
    );
  }
}
