import 'package:flutter/material.dart';
import 'package:web_app/widgets/bottom_bar_column.dart';
import 'package:web_app/widgets/info_text.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  static const Color gradientStartColor = Color(0xFF11998E);
  static const Color gradientEndColor = Color(0xFF0575E6);

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.black,
      // decoration: const BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(0.0)),
      //   boxShadow: [
      //     BoxShadow(
      //       color: gradientStartColor,
      //       offset: Offset(1.0, 6.0),
      //       blurRadius: 1,
      //     ),
      //     BoxShadow(
      //       color: gradientEndColor,
      //       offset: Offset(1.0, 6.0),
      //       blurRadius: 1.0,
      //     )
      //   ],
      //   gradient: LinearGradient(
      //     colors: [gradientStartColor, gradientEndColor],
      //     begin: FractionalOffset(0.2, 0.2),
      //     end: FractionalOffset(1.0, 1.0),
      //     stops: [0.0, 1.0],
      //     tileMode: TileMode.clamp,
      //   ),
      // ),
      child: _size.width < 800 
      ? Column(
        children: [

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [

              BottomBarColumn(
                heading: "ABOUT",
                s1: "Contact Us",
                s2: "About Us",
                s3: "Careers",
              ),

              BottomBarColumn(
                heading: "HELP",
                s1: "Payment",
                s2: "Cancellation",
                s3: "FAQ",
              ),

              BottomBarColumn(
                heading: "SOCIAL",
                s1: "Youtube",
                s2: "Twitter",
                s3: "Facebook",
              ),


            ],
          ),

          const Divider(
            color: Colors.white60,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [

                    InfoText(
                      type: "Email", 
                      text: "dylan@gmail.com",
                    ),

                    SizedBox(height: 5,),

                    InfoText(
                      type: "Address: ",
                      text: "128, Trymore Road, Delft, MN - 56124",
                    )

                  ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'Copyright © 2021 | KRITBOVORN.',
              style: TextStyle(color: Colors.white, fontSize: 14,),
            ),
          ),


        ],
      )
      : Column(
        children: [

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              const BottomBarColumn(
                heading: "ABOUT",
                s1: "Contact Us",
                s2: "About Us",
                s3: "Careers",
              ),

              const BottomBarColumn(
                heading: "HELP",
                s1: "Payment",
                s2: "Cancellation",
                s3: "FAQ",
              ),

              const BottomBarColumn(
                heading: "SOCIAL",
                s1: "Youtube",
                s2: "Twitter",
                s3: "Facebook",
              ),



              Container(
                color: Colors.white,
                width: 2,
                height: 150,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [

                  InfoText(
                    type: "Email", 
                    text: "dylan@gmail.com",
                  ),

                  SizedBox(height: 5,),

                  InfoText(
                    type: "Address: ",
                    text: "128, Trymore Road, Delft, MN - 56124",
                  )

                ],
              )


            ],
          ),

          const Divider(color: Colors.white,),

          const SizedBox(height: 20,),

          const Text(
            'Copyright © 2021 | DBestech',
            style: TextStyle(color: Colors.white, fontSize: 14,),
          ),


        ],
      ),


    );
  }
}