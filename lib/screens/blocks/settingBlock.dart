import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:animaltinder/constValues/ConstValues.dart';
import 'package:animaltinder/components/TileSetting.dart';

class SettingBlock extends StatefulWidget {
  const SettingBlock({Key? key}) : super(key: key);

  @override
  _SettingBlockState createState() => _SettingBlockState();
}

class _SettingBlockState extends State<SettingBlock> {
  double petAge = 8;
  Color activeTileColor = Color(0xFFAFAFAF);
  Color unactiveTileColor = Color(0xFF787878);
  List<String> petSearchingOption = ["Pies", "Kot"];
  List<String> sexOfSearchingPet = ["Ona"];

  @override
  Widget build(BuildContext context) {
    CupertinoPicker iOSPicker(List<String> listOfItems) {
      List<Text> pickerList = [];
      for (String item in listOfItems) {
        pickerList.add(Text(item));
      }

      return CupertinoPicker(
          // backgroundColor: Colors.lightBlue,
          itemExtent: 31.0,
          onSelectedItemChanged: (selectedIndex) {
            print(selectedIndex);
          },
          children: pickerList);
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              child: Text("Województwo"),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: iOSPicker(kkkWojewodztwa)),
          Container(
            child: Text("Od"),
          ),
          Padding(padding: const EdgeInsets.all(15.0), child: iOSPicker(kkkOd)),
          Column(
            children: <Widget>[
              Container(
                child: Text("Zwierzaki"),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                          petSearchingOption.contains('Pies') ? petSearchingOption.remove('Pies') : petSearchingOption.add('Pies');
                          print(petSearchingOption.toString());
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Center(child: Text("Pies")),
                            color: petSearchingOption.contains('Pies') ? activeTileColor : unactiveTileColor,
                            height: 100.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            petSearchingOption.contains('Kot') ? petSearchingOption.remove('Kot') : petSearchingOption.add('Kot');
                            print(petSearchingOption.toString());
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Center(child: Text("Kot")),
                            color: petSearchingOption.contains('Kot') ? activeTileColor : unactiveTileColor,
                            height: 100.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            petSearchingOption.contains('Kon') ? petSearchingOption.remove('Kon') : petSearchingOption.add('Kon');
                            print(petSearchingOption.toString());
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Center(child: Text("Kon")),
                            color: petSearchingOption.contains('Kon') ? activeTileColor : unactiveTileColor,
                            height: 100.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text("Płeć"),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            sexOfSearchingPet.contains('On') ? sexOfSearchingPet.remove('On') : sexOfSearchingPet.add('On');
                            print(sexOfSearchingPet.toString());
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Center(child: Text("On")),
                            color: sexOfSearchingPet.contains('On') ? activeTileColor : unactiveTileColor,
                            height: 100.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            sexOfSearchingPet.contains('Ona') ? sexOfSearchingPet.remove('Ona') : sexOfSearchingPet.add('Ona');
                            print(sexOfSearchingPet.toString());
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Center(child: Text("Ona")),
                            color: sexOfSearchingPet.contains('Ona') ? activeTileColor : unactiveTileColor,
                            height: 100.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text("Wiek"),
              ),
              Slider(
                  value: petAge,
                  activeColor: Colors.grey[300],
                  inactiveColor: Colors.grey[700],
                  min: 0,
                  max: 15,
                  // divisions: 1,
                  onChanged: (double newValue) {
                    setState(() {
                      petAge = newValue;
                    });
                  }),
              Container(
                child: Text("${petAge.round()}"),
              )
            ],
          )
        ],
      ),
    );
  }

  void addPetToPetList(String pet){

  }

  Container textSettingField(@required text) => Container(
        width: double.infinity,
        color: Color(0xFFAEAEAE),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
}

// JakubFigmartyu12#
