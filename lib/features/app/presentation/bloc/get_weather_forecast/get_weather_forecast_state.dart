import 'package:weathque/features/app/domain/entities/forecast_weather_entity.dart';

abstract class GetWeatherForecastState{
  final Map<String, ForecastWeatherEntity>? forecastWeatherEntity;

  const GetWeatherForecastState({
    this.forecastWeatherEntity
  });
}

class GetWeatherForecastLoading extends GetWeatherForecastState{
  const GetWeatherForecastLoading();
}

class GetWeatherForecastDone extends GetWeatherForecastState{
  const GetWeatherForecastDone(Map<String, ForecastWeatherEntity>? forecastWeatherEntity):super(forecastWeatherEntity: forecastWeatherEntity);
}