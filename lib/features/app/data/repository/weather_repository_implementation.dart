import 'package:weathque/core/sensitive.dart';
import 'package:weathque/features/app/data/data_sources/remote/api_service.dart';
import 'package:weathque/features/app/data/models/weather_model.dart';
import 'package:weathque/features/app/domain/repository/weather_repository.dart';

class WeatherRepositoryImplementation implements WeatherRepository{
  final CurrentWeatherApiService _currentWeatherApiService;

  WeatherRepositoryImplementation(this._currentWeatherApiService);

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final httpResponse = await _currentWeatherApiService.getCurrentWeather(cityName: cityName, apiKey: apiKey);

    return httpResponse.data;
  }
}