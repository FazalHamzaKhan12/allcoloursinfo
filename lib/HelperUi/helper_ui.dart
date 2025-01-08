import 'package:allcoloursinfo/colordetailscreen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'color_detail_screen.dart'; // Import the details screen

class ColorSwatchDisplay extends StatelessWidget {
  final Map<String, Color> colorMap = {
    'Amber': Colors.amber,
    'AmberAccent': Colors.amberAccent,
    'Black': Colors.black,
    'Black12': Colors.black.withOpacity(0.12),
    'Black26': Colors.black.withOpacity(0.26),
    'Black38': Colors.black.withOpacity(0.38),
    'Black45': Colors.black.withOpacity(0.45),
    'Black54': Colors.black.withOpacity(0.54),
    'Black87': Colors.black.withOpacity(0.87),
    'Blue': Colors.blue,
    'BlueAccent': Colors.blueAccent,
    'BlueGrey': Colors.blueGrey,
    'Brown': Colors.brown,
    'Cyan': Colors.cyan,
    'CyanAccent': Colors.cyanAccent,
    'DeepOrange': Colors.deepOrange,
    'DeepOrangeAccent': Colors.deepOrangeAccent,
    'DeepPurple': Colors.deepPurple,
    'DeepPurpleAccent': Colors.deepPurpleAccent,
    'Green': Colors.green,
    'GreenAccent': Colors.greenAccent,
    'Grey': Colors.grey,
    'Indigo': Colors.indigo,
    'IndigoAccent': Colors.indigoAccent,
    'LightBlue': Colors.lightBlue,
    'LightBlueAccent': Colors.lightBlueAccent,
    'LightGreen': Colors.lightGreen,
    'LightGreenAccent': Colors.lightGreenAccent,
    'Lime': Colors.lime,
    'LimeAccent': Colors.limeAccent,
    'Orange': Colors.orange,
    'OrangeAccent': Colors.orangeAccent,
    'Pink': Colors.pink,
    'PinkAccent': Colors.pinkAccent,
    'Purple': Colors.purple,
    'PurpleAccent': Colors.purpleAccent,
    'Red': Colors.red,
    'RedAccent': Colors.redAccent,
    'Teal': Colors.teal,
    'TealAccent': Colors.tealAccent,
    'Transparent': Colors.transparent,
    'White': Colors.white,
    'White10': Colors.white.withOpacity(0.10),
    'White12': Colors.white.withOpacity(0.12),
    'White24': Colors.white.withOpacity(0.24),
    'White30': Colors.white.withOpacity(0.30),
    'White38': Colors.white.withOpacity(0.38),
    'White54': Colors.white.withOpacity(0.54),
    'White60': Colors.white.withOpacity(0.60),
    'White70': Colors.white.withOpacity(0.70),
    'Yellow': Colors.yellow,
    'YellowAccent': Colors.yellowAccent,
  };

  String colorToHex(Color color) =>
      '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: colorMap.length,
        itemBuilder: (context, index) {
          String colorName = colorMap.keys.elementAt(index);
          Color colorValue = colorMap[colorName]!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                width: 100,
                height: 50,
                color: colorValue,
              ),
              title: Text(colorName),
              onTap: () {
                // Navigate to the detail screen with the color name and hex code
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ColorDetailScreen(
                      colorName: colorName,
                      colorValue: colorValue,
                      hexCode: colorToHex(colorValue),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
