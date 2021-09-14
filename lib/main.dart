import 'package:flutter/material.dart';
import 'package:animaltinder/screens/anima_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

