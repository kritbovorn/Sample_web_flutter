import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HeaderMenu extends StatelessWidget {

  final String title;
  final bool visble;
  final Function onHover;
  final VoidCallback onTap;
  
  const HeaderMenu({Key? key, required this.title, required this.visble, required this.onTap, required this.onHover}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {

    return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      InkWell(
                        onHover: (value) {

                          onHover(value);

                        },


                        onTap: () {
                          onTap;
                        },
                        child: Column(
                          children: [
                            
                            Text(
                              title,
                              style: GoogleFonts.lato(
                                color: visble ? const Color.fromARGB(255, 209, 165, 21) : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: visble,
                              child: Container(
                                width: 40,
                                height: 3,
                                color: Colors.white,
                              ),
                            ),
                          
                          ],
                        ),
                      ),
                    ],
                  ),
                );
  }
}