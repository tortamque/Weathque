abstract class StorageRepository{
  Future<bool> saveCity(String cityName, String colorValue);
  List<String> getCities();
  Future<void> deleteCity(String cityName);
}