import 'package:weathque/features/app/domain/entities/forecast_weather_entity.dart';
import 'package:weathque/features/app/domain/entities/weather_entity.dart';

abstract class WeatherRepository{
  Future<WeatherEntity> getCurrentWeather(String cityName);
}

abstract class ForecastWeatherRepository{
  Future<ForecastWeatherEntity> getForecast(String cityName);
}