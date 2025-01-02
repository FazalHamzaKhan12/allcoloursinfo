import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Info"),
      ),
      body: Center(child: Container(color: Colors.black,height: 80, width: 80,)),
    );
  }
}
