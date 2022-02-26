import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app/customWidget/header_menu.dart';

class TopBarContent extends StatefulWidget {

  final double opacity;
  
  const TopBarContent({Key? key, required this.opacity}) : super(key: key);

  @override
  State<TopBarContent> createState() => _TopBarContentState();
}

class _TopBarContentState extends State<TopBarContent> {

  final List _isHoverings = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {

    // var screenSize = MediaQuery.of(context).size;

    return Container(
      color: const Color.fromARGB(255, 19, 17, 17).withOpacity(widget.opacity),
      child: Row(
        children: [
      
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Text(
                      "Author",
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      
          Expanded(
            flex: 4,
            child: Row(
              children: [

                
                HeaderMenu(title: "Home", visble: _isHoverings[0], onTap: () {
                  //
                }, onHover: (value) {
                 setState(() {
                    _isHoverings[0] = value;
                    // myFunction(value);
                 });

                }),

                HeaderMenu(title: "About",visble: _isHoverings[1], onTap: () {
                  //
                }, onHover: (value) {
                 setState(() {
                    _isHoverings[1] = value;
                    // myFunction(value);
                 });

                }),

                HeaderMenu(title: "History", visble: _isHoverings[2], onTap: () {
                  //
                }, onHover: (value) {
                 setState(() {
                    _isHoverings[2] = value;
                    // myFunction(value);
                 });

                }),

                HeaderMenu(title: "Contact", visble: _isHoverings[3], onTap: () {
                  //
                }, onHover: (value) {
                 setState(() {
                    _isHoverings[3] = value;
                    // myFunction(value);
                 });

                }),
                


              ],
            ),
          ),

          const Expanded(
            flex: 2,
            child: SizedBox()
          ),


        ],
      ),
    );
  }
}