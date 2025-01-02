import 'package:flutter/material.dart';

class BodyCode extends StatefulWidget {
  const BodyCode({super.key});

  @override
  State<BodyCode> createState() => _BodyCodeState();
}

class _BodyCodeState extends State<BodyCode> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 80,
        width: 80,
      ),
    );
  }
}
