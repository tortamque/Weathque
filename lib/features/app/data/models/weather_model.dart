import 'package:weathque/features/app/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity{
  WeatherModel({
    required coord,
    required weather,
    required base,
    required main,
    required visibility,
    required wind,
    required clouds,
    required dt,
    required sys,
    required timezone,
    required id,
    required name,
    required cod,
  }) : super(
    coord: coord, 
    weather: weather, 
    base: base, 
    information: main, 
    visibility: visibility, 
    wind: wind, 
    clouds: clouds, 
    dt: dt, 
    sunInformation: sys, 
    timezone: timezone, 
    id: id, 
    name: name, 
    cod: cod
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      coord: Coord.fromJson(json['coord']),
      weather: (json['weather'] as List<dynamic>)
          .map((item) => WeatherData.fromJson(item))
          .toList(),
      base: json['base'],
      main: Information.fromJson(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: SunInformation.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}