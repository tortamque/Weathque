abstract class StorageRepository{
  Future<void> saveCity(String cityName);
  List<String>? getCities();
}