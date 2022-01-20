import 'package:shared_preferences/shared_preferences.dart';

class MemoryDataManager{

  void writeToMemory({required String keyName, required List<String> data}) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(keyName, data);
  }

  Future<List<String>> readFromMemory({required String keyName}) async{
    final prefs = await SharedPreferences.getInstance();
    final List<String> data = prefs.getStringList(keyName) ?? [];
    return data;
  }

  void writeNextElementToMemoryTable({required String keyName, required String newValue}) async{
    List<String> memoryData = await readFromMemory(keyName: keyName);
    if(!memoryData.contains(newValue)) {
      memoryData.add(newValue);
      writeToMemory(keyName: keyName, data: memoryData);
    }
  }

  void removeElementFormMemoryTable({required String keyName, required String value}) async{
    List<String> memoryData = await readFromMemory(keyName: keyName);
    if(memoryData.contains(value)) {
      memoryData.remove(value);
      writeToMemory(keyName: keyName, data: memoryData);
    }
  }
}