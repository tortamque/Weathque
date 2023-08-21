abstract class StorageRepository{
  Future<bool> saveCity(String cityName);
  List<String> getCities();
}