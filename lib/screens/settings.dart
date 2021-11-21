import 'package:flutter/material.dart';
import 'package:animaltinder/consts/constatns.dart';


class UserSetting extends StatefulWidget {
  @override
  _UserSettingState createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
      ),
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
        onTap: (index) { print(kkTabItem[index]);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => kkTabItem[index]));
        },
      ),
    );
  }
}