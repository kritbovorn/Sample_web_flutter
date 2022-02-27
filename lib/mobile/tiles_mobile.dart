import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TilesMobile extends StatelessWidget {

  final Size screenSize;
  
  TilesMobile({Key? key, required this.screenSize}) : super(key: key);

  final List<String> assets = [
    "assets/images/test1.jpeg",
    "assets/images/test2.jpeg",
    "assets/images/test3.jpeg",
  ];

  final List<String> title = ["Sci-fi", "Photography", "Romance"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [

          SizedBox(width: screenSize.width / 15,),

          ...Iterable<int>.generate(assets.length).map((int pageIndex) => Row(
            children: [

              Column(
                //
                children: [

                  SizedBox(
                    height: screenSize.width / 2.5,
                    width: screenSize.width / 1.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        assets[pageIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      title[pageIndex],
                      style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w500, color: const Color.fromARGB(255, 145, 157, 166)),
                    ),
                  )

                ],
              ),

              SizedBox(width: screenSize.width / 15,),
            ],
          )),
        ],
      ),
    );
  }
}