import 'package:flutter/material.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/domain/entities/current_city_entity.dart';
import 'package:weathque/features/app/domain/entities/forecast_weather_entity.dart';
import 'package:weathque/features/app/domain/entities/weather_entity.dart';
import 'package:weathque/features/app/presentation/widgets/menu/menu.dart';
import 'package:weathque/features/app/presentation/widgets/misc/AppBar/appbar.dart';

class WeatherPage extends StatelessWidget {
  final WeatherEntity? weatherEntity;
  final ForecastWeatherEntity? forecastWeatherEntity;
  final String currentCity = locator<CurrentCity>().currentCity.string;
  final Color color;

  WeatherPage({
    required this.weatherEntity,
    required this.forecastWeatherEntity,
    required this.color,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: CustomAppBar(title: currentCity),
      body: Row(
      children: [
          const Spacer(flex: 1,),
          Menu(
            weatherEntity: weatherEntity,
            forecastWeatherEntity: forecastWeatherEntity,
            color: color,
          ),
          const Spacer(flex: 1,),
        ],
      ),
    );
  }
}