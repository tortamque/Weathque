import 'package:weathque/features/app/data/data_sources/local/storage.dart';
import 'package:weathque/features/app/domain/repository/storage_repository.dart';

class StorageRepositoryImplementation implements StorageRepository{ 
  final Storage _storage;

  StorageRepositoryImplementation(this._storage);

  @override
  Future<void> saveCity(String cityName) async{
    await _storage.saveCity(cityName);
  }
  
  @override
  List<String>? getCities() {
    return _storage.getCities();
  }
}