import 'package:flutter/material.dart';
import 'package:animaltinder/services/animal_model.dart';
import 'package:animaltinder/services/networking.dart';
import 'package:animaltinder/screens/animal_description.dart';

class LikedBlock extends StatefulWidget {
  @override
  _LikedBlockState createState() => _LikedBlockState();
}

class _LikedBlockState extends State<LikedBlock> {
  List<String> likedAnimalsIds = ['1', '2'];
  NetworkHelper networkHelper = NetworkHelper();
  List<AnimalModel> myLikedAniaml = [];

  void loadBulkAnimalsWithId() async {
    var animalData = await networkHelper.getAnimal(likedAnimalsIds.join(','));
    for (int i = 0; i < likedAnimalsIds.length; i++) {
      myLikedAniaml.add(AnimalModel(
          name: animalData[i]["name"],
          age: animalData[i]["age"],
          sex: animalData[i]["sex"],
          province: animalData[i]["provinceName"],
          breed: animalData[i]["breed"],
          description: animalData[i]["description"],
          photoUrl: animalData[i]["photoUrl"]));
    }
    setState(() {
      myLikedAniaml;
    });
  }

  @override
  void initState() {
    super.initState();
    loadBulkAnimalsWithId();
  }

  @override
 Widget build(BuildContext context){
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(myLikedAniaml.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  AnimalDescription(animalModel: myLikedAniaml[index]))
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(-.2, 0),
                        image: NetworkImage(
                            myLikedAniaml[index].getPhotoUrl()),
                        fit: BoxFit.cover),
                  ),
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    myLikedAniaml[index].getName(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6,
                  ),
                ),
              ),
        );
      }),
    );
  }
}
