import 'package:weathque/features/app/domain/entities/forecast_weather_entity.dart';

class ForecastWeatherModel extends ForecastWeatherEntity {
  ForecastWeatherModel({
    required cod,
    required message,
    required cnt,
    required list,
    required city,
  }):super(
    cod: cod,
    message: message,
    cnt: cnt,
    list: list,
    city: city
  );

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    List<WeatherData> weatherDataList = (json['list'] as List)
        .map((data) => WeatherData.fromJson(data))
        .toList();

    return ForecastWeatherModel(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: weatherDataList,
      city: ForecastCity.fromJson(json['city']),
    );
  }
}
