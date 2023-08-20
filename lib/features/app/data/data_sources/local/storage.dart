import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage {
  late SharedPreferences prefs;
  Future<void> saveCity(String cityName);
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
  Future<void> saveCity(String cityName) async {
    // P.S. This is just a template, I'm aware that it doesn't work as planned. 
    // Will fix it later
    await prefs.setStringList('cities', [cityName]);
  }
  
  @override
  List<String>? getCities() {
    final List<String>? items = prefs.getStringList('cities');

    return items;
  }
}