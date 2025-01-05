import 'package:allcoloursinfo/Theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:allcoloursinfo/Switches/switch_themes.dart';
import 'package:allcoloursinfo/Theme/themes_manager.dart';

class ThemesChanging extends StatefulWidget {
  final ThemeManager themeManager;

  const ThemesChanging({super.key, required this.themeManager});

  @override
  State<ThemesChanging> createState() => _ThemesChangingState();
}

class _ThemesChangingState extends State<ThemesChanging> {
  @override
  void initState() {
    super.initState();
    widget.themeManager.addListener(themeListener);
  }

  @override
  void dispose() {
    widget.themeManager.removeListener(themeListener);
    super.dispose();
  }

  void themeListener() {
    setState(() {}); // Rebuild the widget when theme changes
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    AppBarTheme _appBarTheme = Theme.of(context).appBarTheme;

    return MaterialApp(
      theme: lightTheme, // Light theme
      darkTheme: darkTheme, // Dark theme
      themeMode: widget.themeManager.thememode, // Corrected to use widget.themeManager
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: _appBarTheme.backgroundColor,
          title: Text(
            "Theme Changer",
            style: _textTheme.headlineSmall,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              const Text("Toggle the switch in the AppBar to change the theme."),
              ListTile(
                trailing: SwitchThemes(themeManager: widget.themeManager),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
