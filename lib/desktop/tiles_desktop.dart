import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TilesDesktop extends StatelessWidget {

  final Size screenSize;

  TilesDesktop({Key? key, required this.screenSize}) : super(key: key);

  final List<String> assets = [
    "assets/images/test1.jpeg",
    "assets/images/test2.jpeg",
    "assets/images/test3.jpeg",
  ];

  final List<String> title = ["Sci-fi", "Photography", "Romance"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.05,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          ...Iterable<int>.generate(assets.length).map((int pageIndex) => Column(
            children: [

              SizedBox(
                height: screenSize.width / 6,
                width: screenSize.width / 3.8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        assets[pageIndex],
                        // ***
                      ),
                    ),
                    
                  ),

                
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height / 20,
                ),
                child: Text(
                  title[pageIndex],
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: const Color.fromARGB(255, 145, 157, 166)),
                ),

              )
            ],
          )),
        ],
      ),
    );
  }
}