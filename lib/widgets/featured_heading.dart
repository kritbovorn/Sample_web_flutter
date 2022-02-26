import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedHeading extends StatelessWidget {

  final Size screenSize;
  
  const FeaturedHeading({Key? key, required this.screenSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
    
          const Expanded(child: SizedBox()),
    
          Expanded(
            flex: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          
                Text(
                  "Featured",
                  style: GoogleFonts.raleway(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 217, 220, 224),
                  ),
                ),
          
                Text(
                    "Clue of the wooden cottage",
                    style: GoogleFonts.raleway(fontSize: 18, color: const Color.fromARGB(255, 145, 157, 166)),
                ),
          
              ],
            ),
          ),
    
          const Expanded(child: SizedBox()),
    
        ],
      ),
    );
  }
}