import 'package:weathque/features/app/domain/entities/weather_entity.dart';

abstract class WeatherRepository{
  Future<WeatherEntity> getCurrentWeather(String latitude, String longitude);
}