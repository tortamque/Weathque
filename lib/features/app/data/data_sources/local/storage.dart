import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage {
  SharedPreferences? prefs;
  Future<bool> saveCity(String cityName, String colorValue);
  List<String> getCities();
  List<String> getColors();
  Future<void> deleteCity(String cityName);
}

class StorageImplementation implements Storage{
  SharedPreferences? prefs;

  StorageImplementation(){
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    await _fillEmptyStorage();
  }

  Future<void> ensurePrefsInitialized() async {
    if (prefs == null) {
      await _initPrefs();
    }
  }

  Future<void> _fillEmptyStorage() async{
    List<String> defaultCities = ["Paris", "New York", "Sydney"];
    List<String> defaultColors = ["4294959426", "4282566399", "4294927572"];

    List<String> cities = getCities();
    List<String> colors = getColors();

    if(cities.length == 0 || colors.length == 0){
      await prefs!.setStringList('cities', defaultCities);
      await prefs!.setStringList('colors', defaultColors);
    }
  }

  @override
  Future<bool> saveCity(String cityName, String colorValue) async {
    final List<String> cities = getCities();
    final List<String> colors = getColors();
    
    if(!cities.contains(cityName)){
      cities.add(cityName);
      colors.add(colorValue);
      await prefs!.setStringList('cities', cities);
      await prefs!.setStringList('colors', colors);

      return true;
    }

    return false;
  }
  
  @override
  List<String> getCities() {
    final List<String> cities = prefs!.getStringList('cities') ?? [];

    return cities;
  }

  List<String> getColors(){
    final List<String> colors = prefs!.getStringList('colors') ?? [];

    return colors;
  }
  
  @override
  Future<void> deleteCity(String cityName) async {
    List<String> cities = getCities();
    List<String> colors = getColors();
    int colorIndex = cities.indexWhere((element) => element == cityName);

    cities.remove(cityName);
    colors.removeAt(colorIndex);

    await prefs!.remove('cities');
    await prefs!.remove('colors');
    await prefs!.setStringList('cities', cities);
    await prefs!.setStringList('colors', colors);
  }
}