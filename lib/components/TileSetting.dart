import 'package:flutter/material.dart';

class TileSetting extends StatelessWidget {
  const TileSetting({required this.tailColor, required this.name});

  final Color tailColor;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
              child: Text(name)
          ),
          color: tailColor,
          height: 100.0,
        ),
      ),
    );
  }
}