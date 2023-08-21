import 'package:weathque/core/usecases/usecase.dart';
import 'package:weathque/features/app/domain/repository/storage_repository.dart';

class SaveCityUseCaseImplementation implements SaveCityUseCase{
  final StorageRepository _storage;

  SaveCityUseCaseImplementation(this._storage);
  
  @override
  Future<bool> call({required String cityName}) {
    return _storage.saveCity(cityName);
  }
}