import 'package:flutter/material.dart';
import '../HelperUi/helper_ui.dart';

class BodyCode extends StatefulWidget {
  const BodyCode({super.key});

  @override
  State<BodyCode> createState() => _BodyCodeState();
}

class _BodyCodeState extends State<BodyCode> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(child: ColorSwatchDisplay())
      ],
    );
  }
}
