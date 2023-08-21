abstract class UseCase<Type, String>{
  Future<Type> call({required String cityName});
}

abstract class SaveCityUseCase{
  Future<bool> call({required String cityName});
}

abstract class GetCitiesUseCase{
  List<String>? call();
}