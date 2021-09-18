import 'package:flutter/material.dart';

class AnimalDescription extends StatefulWidget {
  AnimalDescription({@required this.animalData});

  final animalData;

  @override
  _AnimalDescriptionState createState() => _AnimalDescriptionState();
}

class _AnimalDescriptionState extends State<AnimalDescription> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.animalData[0]["Name"]),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(widget.animalData[0]["Description"]),
            )
          ],
        ),
      ),
    );
  }
}
