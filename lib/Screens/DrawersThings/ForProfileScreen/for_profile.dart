import 'package:flutter/material.dart';


class ForProfileScreen extends StatelessWidget {
  const ForProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(),
      body: Column(
        children: [
          const Center(
            child: Hero(
              tag: 'profile-picture',
              child: CircleAvatar(
                radius: 100, // Larger radius to show animation
                backgroundImage:  AssetImage("assets/images/Myf.jpg"),
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            "Fazal Hamza Khan",
            style: TextStyle(
                color: Theme.of(context).textTheme.headlineSmall?.color,
                fontSize: 25),
          ),
    ]
      ),
    );
  }
}
