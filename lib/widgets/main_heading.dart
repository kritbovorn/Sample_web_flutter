import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHeading extends StatelessWidget {

  final Size screenSize;
  
  const MainHeading({Key? key, required this.screenSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenSize.width < 800 
    ? Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 20),
      child: Row(
        children: [

          const Expanded(child: SizedBox()),

          Expanded(
            flex: 15,
            child: Text(
              "Knowledge diversity",
              style: GoogleFonts.lato(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),),
          ),

          const Expanded(child: SizedBox()),

        ],
      ),
    )
    : Padding(
      padding: EdgeInsets.only(
        top: screenSize.height / 10,
        bottom: screenSize.height / 15,
      ),
      child: Column(
        children: [
          Text(
            "Knowledge diversity",
            style: GoogleFonts.lato(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}