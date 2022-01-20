import 'package:flutter/material.dart';
import 'package:animaltinder/services/animal_model.dart';

class AnimalDescription extends StatefulWidget {
  AnimalDescription({required this.animalModel});

  final AnimalModel animalModel;

  @override
  _AnimalDescriptionState createState() => _AnimalDescriptionState();
}

class _AnimalDescriptionState extends State<AnimalDescription> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.animalModel.getName()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.network(widget.animalModel.getPhotoUrl()),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 100.0,
                        child: Center(
                            child: Icon(
                                widget.animalModel.getSex() == 'M' ? Icons.male : Icons.female,
                              size: 70.0
                            ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100.0,
                        child: Center(child: Text(widget.animalModel.getAge(),
                        style: TextStyle(
                          fontSize: 70.0
                        ),
                        )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    child: Text(widget.animalModel.getDescription()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    height: 40.0,
                    width: double.infinity,
                    color: Colors.grey[800],
                    child: Center(child: Text(widget.animalModel.getPlace())),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
