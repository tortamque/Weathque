import 'package:weathque/core/usecases/usecase.dart';
import 'package:weathque/features/app/domain/repository/storage_repository.dart';

class DeleteCityUseCaseImplementation implements DeleteCityUseCase{
  final StorageRepository _storage;

  DeleteCityUseCaseImplementation(this._storage);
  
  @override
  Future<void> call(String cityName) {
    return _storage.deleteCity(cityName);
  }
}
