import 'package:weathque/features/app/domain/entities/weather_entity.dart';

abstract class GetCurrentWeatherState{
  final Map<String, WeatherEntity>? weatherEntity;

  const GetCurrentWeatherState({
    this.weatherEntity
  });
}

class GetCurrentWeatherLoading extends GetCurrentWeatherState{
  const GetCurrentWeatherLoading();
}

class GetCurrentWeatherDone extends GetCurrentWeatherState{
  const GetCurrentWeatherDone(Map<String, WeatherEntity> weatherEntity) : super(weatherEntity: weatherEntity);
}