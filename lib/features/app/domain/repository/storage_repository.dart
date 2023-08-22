abstract class StorageRepository{
  Future<bool> saveCity(String cityName);
  List<String> getCities();
  Future<void> deleteCity(String cityName);
}