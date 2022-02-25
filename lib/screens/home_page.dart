import 'package:flutter/material.dart';
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
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: TopBarContent(opacity: _opacity),
      ),
      body: Column(
        children: [

          SizedBox(
            width: screenSize.width,
            child: AspectRatio(
              aspectRatio: 1 / 0.2,
              child: Image.asset("assets/images/cover.jpg", fit: BoxFit.cover,),
            ),
          ),

          
        ],
      ),
    );
  }
}