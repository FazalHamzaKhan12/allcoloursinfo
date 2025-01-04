import 'package:allcoloursinfo/Screens/DrawersThings/ForProfileScreen/for_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  String userName = "Enter Your UserName"; // Initial name

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
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                margin: EdgeInsets.zero,
                accountName: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Open dialog when Edit button is pressed
                        _editUserNameDialog();
                      },
                      child: Text(
                        userName, // Display dynamic user name
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color:
                              Theme.of(context).textTheme.headlineSmall?.color,
                          decoration: TextDecoration
                              .none, // Add underline for clickable effect
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Open dialog when Edit button is pressed
                        _editUserNameDialog();
                      },
                      child: SizedBox(
                        height: 25,
                        width: 40,
                        child: Icon(
                          Icons.edit,
                          color:
                              Theme.of(context).textTheme.headlineSmall?.color,
                        ),
                      ),
                    )
                  ],
                ),
                accountEmail: Text(
                  "theunknown.pak@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Theme.of(context).textTheme.headlineSmall?.color,
                  ),
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
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                } else {
                  Navigator.pop(
                      context); // Just close the drawer if already on Home
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
              leading: Icon(
                CupertinoIcons.color_filter,
                color: Theme.of(context).textTheme.headlineSmall?.color,
              ),
              title: Text(
                "Themes Changing",
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

  void _editUserNameDialog() {
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Smooth rounded corners
          ),
          backgroundColor:
              Colors.white.withOpacity(0.95), // Semi-transparent background
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjust size based on content
              children: [
                // Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                      size: 30,
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

                // Input Field
                TextField(
                  controller: nameController,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: "Enter your new name",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel Button
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey[700],
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: const Text("Cancel"),
                    ),
                    // Save Button
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (nameController.text.isNotEmpty) {
                            userName = nameController.text; // Update name
                          }
                        });
                        Navigator.of(context).pop(); // Close dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color:
                              Theme.of(context).textTheme.headlineMedium?.color,
                        ),
                      ),
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
