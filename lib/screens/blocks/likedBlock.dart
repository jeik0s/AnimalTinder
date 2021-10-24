import 'package:flutter/material.dart';

class LikedBlock extends StatelessWidget {
  const LikedBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text("Liked"),
        )
      ],
    );
  }
}