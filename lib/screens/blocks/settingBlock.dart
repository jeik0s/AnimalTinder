import 'package:flutter/material.dart';
import 'package:animaltinder/components/TileSetting.dart';

class SettingBlock extends StatefulWidget {
  const SettingBlock({Key? key}) : super(key: key);

  @override
  _SettingBlockState createState() => _SettingBlockState();
}

class _SettingBlockState extends State<SettingBlock> {

  double petAge = 15;
  Color tileColor = Color(0xFF787878);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: textSettingField("Województwo:"),
          ),
          Padding(
            padding: const EdgeInsets.only(left:15.0, right: 15.0, bottom: 15.0),
            child: textSettingField("Od:"),
          ),
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
                    TileSetting(tailColor: tileColor, name: "Pies"),
                    TileSetting(tailColor: tileColor, name: "Kot"),
                    TileSetting(tailColor: tileColor, name: "Koń"),
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
                    TileSetting(tailColor: tileColor, name: "On"),
                    TileSetting(tailColor: tileColor, name: "Ona"),
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
                onChanged: (double newValue){
                  setState(() {
                    petAge = newValue;
                  });
                }
              ),
              Container(
                child: Text("${petAge.round()}"),
              )
            ],
          )
        ],
      ),
    );
  }


  Container textSettingField(@required text) => Container(
          width: double.infinity,
          color: Color(0xFFAEAEAE),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black

              ),
            ),
          ),
        );
  }




// JakubFigmartyu12#
