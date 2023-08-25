import 'package:weathque/core/usecases/usecase.dart';
import 'package:weathque/features/app/domain/repository/storage_repository.dart';

class GetColorsUseCaseImplementation implements GetColorsUseCase{
  final StorageRepository _storage;

  GetColorsUseCaseImplementation(this._storage);

  @override
  List<String> call() {
    return _storage.getColors();
  }
}