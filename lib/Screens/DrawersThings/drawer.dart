import 'package:allcoloursinfo/Screens/DrawersThings/ForProfileScreen/for_profile.dart';
import 'package:allcoloursinfo/home_screen.dart';
import 'package:allcoloursinfo/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Theme/themes_manager.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key, this.themeManager});
  final ThemeManager? themeManager;

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  late final ThemeManager _effectiveThemeManager;

  @override
  void initState() {
    super.initState();
    // Use the provided themeManager or create a default one
    _effectiveThemeManager = widget.themeManager ?? ThemeManager();
  }

  String userName = "Enter Your UserName"; // Initial name
  String userEmail = "Enter Your Email"; // Initial email

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                margin: EdgeInsets.zero,
                accountName: Row(
                  children: [
                    Text(
                        userName, // Display dynamic user name
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).textTheme.headlineSmall?.color,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: _editUserNameDialog,
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: Theme.of(context).textTheme.headlineSmall?.color,
                      ),
                    ),
                  ],
                ),
                accountEmail: Row(
                  children: [
                    Text(
                        userEmail,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Theme.of(context).textTheme.headlineSmall?.color,
                        ),
                      ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: _editEmailDialog,
                      child: Icon(
                        Icons.edit,
                        size: 15,
                        color: Theme.of(context).textTheme.headlineSmall?.color,
                      ),
                    ),
                  ],
                ),
                currentAccountPicture: GestureDetector(
                  onTap: () {
                    // Navigate to Profile Screen with Hero animation
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForProfileScreen(),
                      ),
                    );
                  },
                  child: const Hero(
                    tag: 'profile-picture',
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/Myf.jpg"),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                // Check if current route is not the same as Home screen
                if (ModalRoute.of(context)?.settings.name != '/') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomeScreen(themeManager: _effectiveThemeManager),
                    ),
                  );
                } else {
                  Navigator.pop(context); // Just close the drawer if already on Home
                }
              },
              leading: Icon(
                CupertinoIcons.home,
                color: Theme.of(context).textTheme.headlineSmall?.color,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headlineSmall?.color,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(
                      themeManager: _effectiveThemeManager,
                    ),
                  ),
                );
              },
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).textTheme.headlineSmall?.color,
              ),
              title: Text(
                "Settings",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headlineSmall?.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dialog for editing user name
  void _editUserNameDialog() {
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                      size: 28,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Edit User Name",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: "Enter your new name",
                    hintStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (nameController.text.isNotEmpty) {
                            userName = nameController.text;
                          }
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Dialog for editing email
  void _editEmailDialog() {
    TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                      size: 28,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Edit Email",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: "Enter your new email",
                    hintStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (emailController.text.isNotEmpty) {
                            userEmail = emailController.text;
                          }
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
