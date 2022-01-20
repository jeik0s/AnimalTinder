import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{

  int currentAnimal = 0;

  Future<dynamic> getAnimal(String animalId) async{
    var url = Uri.http('localhost:8000', '/', {'getAnimal': '$animalId'});
//    print(url);
    var response = await http.get(url);
    if(response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } catch(e){
        return jsonDecode('{}');
      }
    }
  }

  Future<dynamic> getNextAnimal() async {
    currentAnimal++;
    var url = Uri.http('localhost:8000', '/', {'getAnimal': '$currentAnimal'});
    var response = await http.get(url);
    if(response.statusCode == 200)
        return jsonDecode(response.body);
  }

}