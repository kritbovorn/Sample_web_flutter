import 'package:flutter/material.dart';
// import 'package:web_app/responsive/responsive.dart';

class FloatingQuickAccessBar extends StatefulWidget {

  final Size screenSize;
  
  const FloatingQuickAccessBar({Key? key, required this.screenSize}) : super(key: key);

  @override
  State<FloatingQuickAccessBar> createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {

  final List _isHoverings = [false, false, false, false,];

  List<Widget> rowElements = [];

  List<String> items = ["History", "Science", "Philosophy", "Novels"];

  List<IconData> icons = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny,
  ];

  List<Widget> generateRowElements() {

    rowElements.clear();

    for (int i = 0; i < items.length; i++) {

      Widget elementTile = InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onHover: (value) {
        setState(() {
          value ? _isHoverings[i] = true : _isHoverings[i] = false;
        });
      },
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              items[i],
              style: TextStyle(
                color: _isHoverings[i] ? Colors.blueGrey[900] : Colors.blueGrey,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      );

      Widget spacer = SizedBox(
      height: 16,
      child: VerticalDivider(
        width: 1,
        color: Colors.blueGrey[100],
        thickness: 1,
      ),
      );

      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: widget.screenSize.height * 0.5),
      child: Row(
        children: [
      
          const Expanded(child: SizedBox(),),
      
          Expanded(
            flex: 2,
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: generateRowElements(),
                ),
              ),
            ),
          ),
      
          const Expanded(child: SizedBox()),
        ],
      ),
    );
    
    
  }
}