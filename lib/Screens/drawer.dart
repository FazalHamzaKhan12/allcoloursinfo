import 'package:allcoloursinfo/Screens/themeschanging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
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
                accountName: Text(
                  "Fazal Hamza Khan",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).textTheme.headlineSmall?.color),
                ),
                accountEmail: Text("theunknown.pak@gmail.com",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color:
                            Theme.of(context).textTheme.headlineSmall?.color)),
                currentAccountPicture: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/Myf.jpg"),
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
                    color: Theme.of(context).textTheme.headlineSmall?.color),
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
}
