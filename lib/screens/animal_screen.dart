import 'package:animaltinder/screens/animal_description.dart';
import 'package:flutter/material.dart';

// Services
import 'package:animaltinder/services/networking.dart';

// Screens
import 'package:animaltinder/screens/animal_screen.dart';

class AnimalScreen extends StatefulWidget {
  @override
  _AnimalScreenState createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  NetworkHelper networkHelper = NetworkHelper();

  var animalData;
  String animalName = "";
  String animalAge = "";
  String animalBreed = "";
  String animalDescription = "";
  String animalPhoto = "https://via.placeholder.com/1000";

//  void getAllAnimalsData() async {
//    var animalData = await networkHelper.getAnimal("1");
//    print(animalData);
//  }

  void loadNextAnimal() async {
    animalData = await networkHelper.getNextAnimal();
    setState(() {
      animalName = animalData[0]["Name"];
      animalAge = animalData[0]["Age"];
      animalBreed = animalData[0]["Breed"];
      animalDescription = animalData[0]["Description"];
      animalPhoto = animalData[0]["PhotoLink"];
    });
  }

  @override
  void initState() {
    super.initState();
    loadNextAnimal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimalTinder'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 21,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 30.0, bottom: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AnimalDescription(animalData: animalData);
                                },
                              ),
                            );
                          },
                          child: Container(
                            child: Image.network(
                              "$animalPhoto",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        color: Colors.grey[600],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(animalName),
                            Text("$animalAge lat - $animalBreed")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                loadNextAnimal();
                              },
                              icon: Icon(
                                Icons.favorite,
                                size: 40,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                loadNextAnimal();
                              },
                              icon: Icon(
                                Icons.arrow_circle_down,
                                size: 40,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
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
      ),
    );
  }
  //https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
}
