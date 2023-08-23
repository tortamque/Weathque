import 'package:weathque/features/app/data/data_sources/local/storage.dart';
import 'package:weathque/features/app/domain/repository/storage_repository.dart';

class StorageRepositoryImplementation implements StorageRepository{ 
  final Storage _storage;

  StorageRepositoryImplementation(this._storage);

  @override
  Future<bool> saveCity(String cityName, String colorValue) async{
    return await _storage.saveCity(cityName, colorValue);
  }
  
  @override
  List<String> getCities() {
    return _storage.getCities();
  }
  
  @override
  Future<void> deleteCity(String cityName) async {
    await _storage.deleteCity(cityName); 
  }
}