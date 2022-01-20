import 'package:flutter/material.dart';


// Services
import 'package:animaltinder/services/networking.dart';

// Blocks
import 'package:animaltinder/screens/blocks/searchBlock.dart';
import 'package:animaltinder/screens/blocks/likedBlock.dart';
import 'package:animaltinder/screens/blocks/settingBlock.dart';
import 'package:animaltinder/services/networking.dart';

class AnimalScreen extends StatefulWidget {
  @override
  _AnimalScreenState createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  bool NetworkWorking = false;

  @override
  initState() {
    checkNetwork();
    super.initState();
  }

  checkNetwork() async {
    try {
      await NetworkHelper().getAnimal("1");
      print('działa');
      NetworkWorking = true;
    } catch (e) {
      print('nie działa');
    }
  }

  int selectedBlock = 0;

  Widget scaffoldNetworkWorking() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AnimalTinder',
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

  Widget scaffoldNetworkNotWorking() {
    return Scaffold(
        body: Container(
      child: Center(
          child: Text(
              "No internet connection \n please turn on internet and restart the app",
          textAlign: TextAlign.center,),
      ),
      color: Colors.black,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return (NetworkWorking
        ? scaffoldNetworkWorking()
        : scaffoldNetworkNotWorking());
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
