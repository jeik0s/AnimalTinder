import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{

  Future<dynamic> getAnimal(String animalId) async{
    var url = Uri.http('localhost:8000', '/', {'getAnimal': '$animalId'});
    print(url);
    var response = await http.get(url);
    if(response.statusCode == 200)
      return jsonDecode(response.body);
  }

}