import 'package:flutter/material.dart';
import 'package:weathque/features/app/domain/entities/forecast_weather_entity.dart';
import 'package:weathque/features/app/domain/entities/weather_entity.dart';
import 'package:weathque/features/app/presentation/widgets/menu/menu.dart';
import 'package:weathque/features/app/presentation/widgets/misc/AppBar/appbar.dart';

class WeatherPage extends StatelessWidget {
  final WeatherEntity? weatherEntity;
  final ForecastWeatherEntity? forecastWeatherEntity;
  final Color color;
  final String city;

  const WeatherPage({
    required this.weatherEntity,
    required this.forecastWeatherEntity,
    required this.color,
    super.key, required this.city
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color,
      appBar: CustomAppBar(title: city),
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