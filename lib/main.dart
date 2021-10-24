import 'package:flutter/material.dart';
import 'package:animaltinder/screens/animal_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimalTinder',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MaterialApp(
        theme: ThemeData.dark(),
        home: AnimalScreen(),
      ),
    );
  }
}

