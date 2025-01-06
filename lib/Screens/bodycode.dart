import 'package:flutter/material.dart';

class BodyCode extends StatefulWidget {
  const BodyCode({super.key});

  @override
  State<BodyCode> createState() => _BodyCodeState();
}

class _BodyCodeState extends State<BodyCode> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            children: [
              Container(
                height: 50, // Set the height of the rectangle
                width: 100, // Set the width of the rectangle
                decoration: BoxDecoration(
                  color: Colors.yellow[500], // Highlight color
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  border: Border.all(
                    color: Colors.black, // Border color (optional)
                    width: .5, // Border width (optional)
                  ),
                ),
                child: Center(
                    child: Text(
                  "Green",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headlineSmall?.color,fontSize: 20),

                )),
              ),
            ],
          ),
        );
      },
    );
  }
}
