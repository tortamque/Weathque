import 'package:weathque/core/usecases/usecase.dart';
import 'package:weathque/features/app/domain/repository/storage_repository.dart';

class GetCitiesUseCaseImplementation implements GetCitiesUseCase{
  final StorageRepository _storage;

  GetCitiesUseCaseImplementation(this._storage);

  @override
  List<String>? call() {
    return _storage.getCities();
  }
}