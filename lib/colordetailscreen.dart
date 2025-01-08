import 'package:flutter/material.dart';

class ColorDetailScreen extends StatelessWidget {
  final String colorName;
  final Color colorValue;
  final String hexCode;

  const ColorDetailScreen({
    Key? key,
    required this.colorName,
    required this.colorValue,
    required this.hexCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$colorName Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: colorValue,
            ),
            const SizedBox(height: 20),
            Text(
              colorName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Hex Code: $hexCode',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
