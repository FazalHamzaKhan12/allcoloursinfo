import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: Container(
            color: Colors.deepPurple,
            child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: UserAccountsDrawerHeader(
                        decoration: BoxDecoration(color: Colors.deepPurple),
                        margin: EdgeInsets.zero,
                        accountName: Text(
                          "Fazal Hamza Khan",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        accountEmail: Text("theunknown.pak@gmail.com",
                            style:
                            TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                        currentAccountPicture:
                        CircleAvatar(radius: 50,
                          backgroundImage: AssetImage("assets/images/Myf.jpg"),)
                    ),
                  ),

                  //for home
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Home",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ])));
  }
}
