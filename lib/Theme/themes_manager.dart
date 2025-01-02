import 'package:flutter/material.dart';
// Define ThemeManager class to manage theme state
// Define ThemeManager class to manage theme state
class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light; // Default theme mode is light

  ThemeMode get thememode => _themeMode; // Getter for theme mode

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light; // Toggle theme
    notifyListeners(); // Notify listeners about changes
  }
}

// Create a global instance of ThemeManager


