import 'package:weathque/core/sensitive.dart';
import 'package:weathque/features/app/data/data_sources/remote/api_service.dart';
import 'package:weathque/features/app/data/models/weather_model.dart';
import 'package:weathque/features/app/domain/entities/forecast_weather_entity.dart';
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

class ForecastWeatherRepositoryImplementation implements ForecastWeatherRepository{
  final ForecastWeatherApiService _forecastWeatherApiService;

  ForecastWeatherRepositoryImplementation(this._forecastWeatherApiService);

  @override
  Future<ForecastWeatherEntity> getForecast(String cityName) async {
    final httpResponse = await _forecastWeatherApiService.getForecast(cityName: cityName, apiKey: apiKey);

    return httpResponse.data;
  }  
}