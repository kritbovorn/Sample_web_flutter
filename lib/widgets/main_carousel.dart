// import 'package:carousel_slider/carousel_controller.dart'; 
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainCarousel extends StatefulWidget {
  const MainCarousel({Key? key}) : super(key: key);

  @override
  State<MainCarousel> createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {

  int _current = 0;

  final String imagePath = "assets/images/";

  final CarouselController _carouselController = CarouselController();

  final List<bool> _isHoverings = [false, false, false, false, false, false, false,];
  final List<bool> _isSelecteds = [true, false, false, false, false, false, false,];

  final List<String> images = [
    'assets/images/asia.jpg',
    'assets/images/africa.jpg',
    'assets/images/europe.jpg',
    'assets/images/south_america.jpg',
    'assets/images/australia.jpg',
    'assets/images/antarctica.jpg',
  ];

  final List<String> places = [
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'AUSTRALIA',
    'ANTARCTICA',
  ];

  List<Widget> generateImageTiles(screenSize) {

    return images.map((element) => ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        element,
        fit: BoxFit.cover,
      ),
    ),).toList();
  }

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [

        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 18 / 8,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                
                _current = index;

                for (int i = 0; i < imageSliders.length; i++) {
                  if ( i == index) {
                    _isSelecteds[i] = true;
                  } else {
                    _isSelecteds[i] = false;
                  }
                }
              });
            }
          ),

          carouselController: _carouselController,
        ),


        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              places[_current],
              style: GoogleFonts.electrolize(color: Colors.white, fontSize: screenSize.width / 25, letterSpacing: 8),
            ),
          ),
        ),

        screenSize.width < 800
        ? Container(
          
        )
        : AspectRatio(
          aspectRatio: 17 / 8,
          child: Center(
            heightFactor: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width / 8,
                  right: screenSize.width / 8,
                ),
                child: Card(
                  color: Colors.black,
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height / 50,
                      bottom: screenSize.height / 50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        for (int i = 0; i < places.length; i++) 

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onHover: (value) {
                                  setState(() {
                                    value ? _isHoverings[i] = true : _isHoverings[i] = false;
                                  });
                                },
                                onTap: () {
                                  _carouselController.animateToPage(i);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: screenSize.height / 80,
                                    bottom: screenSize.height / 90,
                                  ),
                                  child: Text(
                                    places[i],
                                    style: TextStyle(color: _isHoverings[i] ? Colors.blueGrey[900] : Colors.blueGrey),
                                  ),
                                ),
                              ),

                              Visibility(
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                visible: _isSelecteds[i],
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 400),
                                  opacity: _isSelecteds[i] ? 1 : 0,
                                  child: Container(
                                    height: 5,
                                    width: screenSize.width / 10,
                                    decoration: const BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        

                      ],
                    ),

                  ),
                ),
              ),
            ),
          ),
        ),



      ],
    );
  }
}