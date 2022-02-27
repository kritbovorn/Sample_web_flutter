import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {

  final Size screenSize;

  const MenuDrawer({Key? key, required this.screenSize }) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {

  final List<bool> _isHoverings = [false, false, false, false,];

  List<Widget> columnMenus = [];

  List<String> items = ["History", "Science", "Philosophy", "Novels"];

  List<IconData> icons = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny,
  ];

  List<Widget> generatedColumnMenus() {

    columnMenus.clear();

    for (int i = 0; i < items.length; i++) {

      Widget menu = InkWell(
        // ***
        // ***
        onHover: (value) {
          setState(() {
            value ? _isHoverings[i] = true : _isHoverings[i] = false;
          });
        },
        onTap: () {},
        child: Text(
          items[i],
          style: TextStyle(color: _isHoverings[i] ? const Color.fromARGB(255, 155, 132, 5) : Colors.blueGrey, fontSize: 22),
        ),

      );

      Widget divider = Divider(
        color: Colors.blueGrey[400],
        thickness: 2,
      );

      columnMenus.add(menu);
      if (i < items.length) {
        columnMenus.add(divider);
      }
    }

    return columnMenus;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: const Color.fromARGB(255, 60, 60, 63),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)
                ),
               
                child: Image.asset("assets/images/trekking.jpg"),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: generatedColumnMenus(),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Copyright © 2021 | DBestech',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}