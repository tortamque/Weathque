abstract class UseCase<Type, String>{
  Future<Type> call({required String cityName});
}

abstract class SaveCityUseCase{
  Future<bool> call({required String cityName, required String colorValue});
}

abstract class GetCitiesUseCase{
  List<String> call();
}

abstract class GetColorsUseCase{
  List<String> call();
}

abstract class DeleteCityUseCase{
  Future<void> call(String cityName);
}