import 'package:weathque/features/app/domain/entities/forecast_weather_entity.dart';

abstract class GetWeatherForecastState{
  final ForecastWeatherEntity? forecastWeatherEntity;

  const GetWeatherForecastState({
    this.forecastWeatherEntity
  });
}

class GetWeatherForecastLoading extends GetWeatherForecastState{
  const GetWeatherForecastLoading();
}

class GetWeatherForecastDone extends GetWeatherForecastState{
  const GetWeatherForecastDone(ForecastWeatherEntity? forecastWeatherEntity):super(forecastWeatherEntity: forecastWeatherEntity);
}