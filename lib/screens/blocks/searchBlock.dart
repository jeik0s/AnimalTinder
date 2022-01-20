import 'package:animaltinder/constValues/ConstValues.dart';
import 'package:animaltinder/services/memory_data_manager.dart';
import 'package:flutter/material.dart';

import 'package:animaltinder/services/networking.dart';
import 'package:animaltinder/screens/animal_description.dart';
import 'package:animaltinder/services/animal_model.dart';

class SearchBlock extends StatefulWidget {
  const SearchBlock({Key? key}) : super(key: key);

  @override
  _SearchBlockState createState() => _SearchBlockState();
}

class _SearchBlockState extends State<SearchBlock> {
  NetworkHelper networkHelper = NetworkHelper();

  var animalData;
  String animalID = "";
  String animalName = "";
  String animalAge = "";
  String animalSex = "";
  String animalProvince = "";
  String animalBreed = "";
  String animalDescription = "";
  String animalPhoto = "https://via.placeholder.com/1000";
  String animalPlace = "";

  void getAllAnimalsData() async {
    var animalData = await networkHelper.getAnimal("1");
    print(animalData);
  }

  void loadNextAnimal() async {
    animalData = await networkHelper.getNextAnimal();
    setState(() {
      animalID = animalData[0]["animalID"];
      animalName = animalData[0]["name"];
      animalAge = animalData[0]["age"];
      animalSex = animalData[0]["sex"];
      animalProvince = animalData[0]["provinceName"];
      animalBreed = animalData[0]["breed"];
      animalDescription = animalData[0]["description"];
      animalPhoto = animalData[0]["photoUrl"];
      animalPlace = animalData[0]["environment"];
    });
  }


  @override
  void initState() {
    super.initState();
    loadNextAnimal();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
//                                return AnimalDescription();
                                return AnimalDescription(animalModel: AnimalModel(id: animalID,name: animalName, age: animalAge, sex: animalSex, province: animalProvince, breed: animalBreed, description: animalDescription, photoUrl: animalPhoto, place: animalPlace));
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
                              MemoryDataManager().writeNextElementToMemoryTable(keyName: kkklikedAnimalsArrayName, newValue: animalID);
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
    );
  }
}


