import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage {
  late SharedPreferences prefs;
  Future<bool> saveCity(String cityName);
  List<String>? getCities();
}

class StorageImplementation implements Storage{
  late SharedPreferences prefs;

  StorageImplementation() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> saveCity(String cityName) async {
    final List<String> cities = getCities() ?? [];
    
    if(!cities.contains(cityName)){
      cities.add(cityName);
      await prefs.setStringList('cities', cities);

      return true;
    }

    return false;
  }
  
  @override
  List<String>? getCities() {
    final List<String>? cities = prefs.getStringList('cities');

    return cities;
  }
}