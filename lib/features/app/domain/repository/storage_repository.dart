abstract class StorageRepository{
  Future<bool> saveCity(String cityName, String colorValue);
  List<String> getCities();
  List<String> getColors();
  Future<void> deleteCity(String cityName);
}