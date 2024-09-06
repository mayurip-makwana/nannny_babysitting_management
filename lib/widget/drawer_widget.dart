import 'package:flutter/material.dart';
import 'package:nanny_vanny/data/drawer_items.dart';
import 'package:nanny_vanny/model/drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelecteditem;
  final Color lightPink = Color(0xFFD37CA5);

  DrawerWidget({
    Key? key,
    required this.onSelecteditem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        buildDrawerItems(context),
      ],
    ));
  }

  Widget buildDrawerItems(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final double percentageWidth = screenWidth * 0.55;

    return Container(
      width: percentageWidth,
      child: Column(children: [
        SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          height: 90,
          width: 90, // Ensure it's a circle
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: lightPink, // Pink border for the circle
              width: 4.0,
            ),
          ),
          child: Image.asset('assets/images/news.png'),
        ),
        SizedBox(height: 20),
        const Text(
          'Emily Cyruss',
          style: TextStyle(
            color: Color(0xFFD37CA5), // Light pink text color
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        ...DrawerItems.all.map((item) {
          return Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Change to desired color
                  width: 1.0, // Change to desired width
                ),
              ),
            ),
            child: ListTile(
              // contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              // leading: Icon(item.icon, color: Colors.black),
              title: Align(
                  alignment: Alignment.centerLeft,
                  child:
                      Text(item.title, style: TextStyle(color: Colors.black))),
              onTap: () => onSelecteditem(item),
              selectedTileColor: Colors.blue.shade200,
              tileColor: Colors.white,
              selectedColor: lightPink,
            ),
          );
        }).toList(),
      ]),
    );
    //   ],
    // );
    // );
  }
}
