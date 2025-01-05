import 'package:allcoloursinfo/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:allcoloursinfo/Theme/theme_data.dart';
import 'package:allcoloursinfo/Theme/themes_manager.dart';

import 'Switches/switch_themes.dart';

ThemeManager _themeManager = ThemeManager();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _themeManager.addListener(themeListener);
  }

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  void themeListener() {
    setState(() {}); // Rebuild the app when theme changes
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Switcher',
      theme: lightTheme, // Light theme
      darkTheme: darkTheme, // Dark theme
      themeMode: _themeManager.thememode, // Dynamically switch themes
      home: HomeScreen(themeManager: _themeManager), // Pass ThemeManager
    );
  }
}
