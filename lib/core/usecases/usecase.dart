abstract class UseCase<Type, String>{
  Future<Type> call({required String cityName});
}