import 'package:allcoloursinfo/Screens/bodycode.dart';
import 'package:allcoloursinfo/Screens/DrawersThings/drawer.dart';
import 'package:allcoloursinfo/Theme/theme_data.dart';
import 'package:allcoloursinfo/Theme/themes_manager.dart';
import 'package:flutter/material.dart';


ThemeManager _themeManager = ThemeManager();

// Define primary color



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
    // Add a listener to rebuild the app when the theme changes
    _themeManager.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _themeManager.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Test',
      theme: lightTheme, // Light theme definition
      darkTheme: darkTheme, // Dark theme definition
      themeMode: _themeManager.thememode, // Dynamically switch between light and dark
      home: HomeScreen(themeManager: _themeManager), // Pass theme manager
    );
  }
}

class HomeScreen extends StatefulWidget {
  final ThemeManager themeManager; // Receive ThemeManager as a parameter

  const HomeScreen({super.key, required this.themeManager});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Add a listener to update the screen when the theme changes
    widget.themeManager.addListener(themeListener);
  }

  @override
  void dispose() {
    // Remove the listener when the screen is disposed
    widget.themeManager.removeListener(themeListener);
    super.dispose();
  }

  void themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get text theme from the current theme
    TextTheme _textTheme = Theme.of(context).textTheme;
    AppBarTheme _appbarTheme = Theme.of(context).appBarTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _appbarTheme.backgroundColor, // Use dynamic color
        actions: [
          Switch(
            activeColor: Colors.deepPurple[300], // Thumb color when ON
            activeTrackColor: Colors.deepPurple[200], // Track color when ON
            inactiveThumbColor: Colors.black54, // Thumb color when OFF
            inactiveTrackColor: Colors.green, // Track color when OFF
            value: widget.themeManager.thememode == ThemeMode.dark,
            onChanged: (newValue) {
              // Toggle theme on switch change
              widget.themeManager.toggleTheme(newValue);
            },
          ),
        ],
        title: Text(
          "Color Info",
          style: _textTheme.headlineSmall,
        ),

      ),
      body: const BodyCode(),
      drawer: const DrawerPage()
    );
  }
}
