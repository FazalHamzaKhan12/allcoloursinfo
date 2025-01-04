import 'package:flutter/material.dart';

// Define primary color

// Define light theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue[700], // Vibrant and inviting
  scaffoldBackgroundColor: Colors.white, // Neutral background
  appBarTheme: AppBarTheme(
    color: Colors.blue[700], // Slightly darker shade for AppBar
    iconTheme: const IconThemeData(color: Colors.white), // White icons on AppBar
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(color: Colors.black, fontSize: 18),
    headlineMedium: TextStyle(color: Colors.black87, fontSize: 20),
    headlineLarge: TextStyle(color: Colors.black87, fontSize: 24),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue[600], // Buttons match primary color
    textTheme: ButtonTextTheme.primary,
  ),
);

// Define dark theme
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.teal[700], // Calming and modern
  scaffoldBackgroundColor: Colors.grey[900], // Deep gray background
  appBarTheme: AppBarTheme(
    color: Colors.teal[700], // Contrasting AppBar
    iconTheme: const IconThemeData(color: Colors.white), // White icons
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(color: Colors.white, fontSize: 18),
    headlineMedium: TextStyle(color: Colors.white70, fontSize: 25),
    headlineLarge: TextStyle(color: Colors.white70, fontSize: 40),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.teal[300], // Match accent color
    textTheme: ButtonTextTheme.primary,
  ),
);
