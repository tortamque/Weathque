import 'package:weathque/features/app/data/models/weather_model.dart';
import 'package:weathque/features/app/domain/repository/weather_repository.dart';

class WeatherRepositoryImplementation implements WeatherRepository{
  @override
  Future<WeatherModel> getCurrentWeather() {
    throw UnimplementedError();
  }
}