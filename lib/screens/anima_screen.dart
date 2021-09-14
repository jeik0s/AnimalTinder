import 'package:flutter/material.dart';
import 'package:animaltinder/services/Networking.dart';

class AnimalScreen extends StatefulWidget {
  @override
  _AnimalScreenState createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  void getAllAnimalsData() async {
    var animalData = await NetworkHelper().getAnimal("2");
    print(animalData);
  }

  @override
  void initState() {
    super.initState();
    getAllAnimalsData();
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
                          child: Container(
                            child: Image.network(
                                  "https://www.essentialliving.co.uk/wp-content/uploads/2021/02/Where-to-Adopt-a-Dog-in-London_Thumbnail.png",
                                  fit: BoxFit.fitHeight,
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
                              Text("Kleks"),
                              Text("3 lata - Kundel")
                            ],
                    ),
                        ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              size: 40,
                            ),
                            Icon(
                              Icons.arrow_circle_down,
                              size: 40,
                            )
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
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
  //https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
}
