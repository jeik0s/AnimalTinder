import 'package:flutter/material.dart';

// Services
import 'package:animaltinder/services/networking.dart';

// Blocks
import 'package:animaltinder/screens/blocks/searchBlock.dart';
import 'package:animaltinder/screens/blocks/likedBlock.dart';
import 'package:animaltinder/screens/blocks/settingBlock.dart';

class AnimalScreen extends StatefulWidget {
  @override
  _AnimalScreenState createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {

  int selectedBlock = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimalTinder',
          style: TextStyle(fontFamily: 'AlfaSlabOne'),
        ),
      ),
      body: blocks.elementAt(selectedBlock),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Liked',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedBlock,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    print(index);
    setState(() {
      selectedBlock = index;
    });
  }

  List blocks = [
    SearchBlock(),
    LikedBlock(),
    SettingBlock(),
  ];

  //https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
}




