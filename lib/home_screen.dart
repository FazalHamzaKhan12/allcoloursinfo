import 'package:flutter/material.dart';
import 'package:allcoloursinfo/Theme/themes_manager.dart';
import 'package:allcoloursinfo/Screens/bodycode.dart';
import 'package:allcoloursinfo/Screens/DrawersThings/drawer.dart';

class HomeScreen extends StatelessWidget {
  final ThemeManager themeManager;

  const HomeScreen({super.key, required this.themeManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Info"),
      ),
      body: const BodyCode(),
      drawer: DrawerPage(themeManager: themeManager),
    );
  }
}
