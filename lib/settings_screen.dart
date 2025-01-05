import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:allcoloursinfo/Switches/switch_themes.dart';
import 'package:allcoloursinfo/Theme/themes_manager.dart';

class SettingsScreen extends StatelessWidget {
  final ThemeManager themeManager;

  const SettingsScreen({super.key, required this.themeManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: Column(
          children: [
            themeChanging(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  ListTile themeChanging(BuildContext context) {
    return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Adjust padding
            leading: Icon(
              CupertinoIcons.color_filter,
              size: 30, // Increased icon size
              color: Theme.of(context).primaryColor, // Icon color based on theme
            ),
            title: Text(
              "Theme Changing",
              style: TextStyle(
                fontSize: 18, // Increased font size
                fontWeight: FontWeight.bold, // Bold title text
                color: Theme.of(context).textTheme.headlineSmall?.color, // Theme color
              ),
            ),
            subtitle: Text(
              "Teal Color & Blue Theme",
              style: TextStyle(
                fontSize: 14, // Subtitle size
                color: Colors.grey[600], // Subtitle color
              ),
            ),
            trailing: Container(
              margin: const EdgeInsets.only(right: 10), // Add spacing for better alignment
              child: SwitchThemes(themeManager: themeManager), // SwitchThemes widget
            ),
            tileColor: Theme.of(context).cardColor, // Background color based on theme
            shape: RoundedRectangleBorder(
            // Rounded corners
            ),
          );
  }
}
