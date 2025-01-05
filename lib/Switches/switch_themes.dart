import 'package:flutter/material.dart';
import '../../Theme/themes_manager.dart';

ThemeManager _themeManager = ThemeManager();


class SwitchThemes extends StatefulWidget {
  const SwitchThemes({super.key, required this.themeManager});

  final ThemeManager themeManager;

  @override
  State<SwitchThemes> createState() => _SwitchThemesState();
}

class _SwitchThemesState extends State<SwitchThemes> {
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
    return Switch(
      activeColor: Colors.deepPurple[300], // Thumb color when ON
      activeTrackColor: Colors.deepPurple[200], // Track color when ON
      inactiveThumbColor: Colors.black54, // Thumb color when OFF
      inactiveTrackColor: Colors.green, // Track color when OFF
      value: widget.themeManager.thememode == ThemeMode.dark,
      onChanged: (value) {
        widget.themeManager.toggleTheme(value); // Toggle the theme
      },
    );
  }
}
