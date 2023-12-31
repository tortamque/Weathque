import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/domain/entities/forecast_weather_entity.dart';
import 'package:weathque/features/app/domain/entities/summary_builder.dart';
import 'package:weathque/features/app/domain/entities/weather_entity.dart';
import 'package:weathque/features/app/presentation/widgets/condition/condition.dart';
import 'package:weathque/features/app/presentation/widgets/date/date.dart';
import 'package:weathque/features/app/presentation/widgets/misc/headers/summary_header/header.dart';
import 'package:weathque/features/app/presentation/widgets/misc/headers/forecast_header/weekly_forecast_header.dart';
import 'package:weathque/features/app/presentation/widgets/summary_text/summary.dart';
import 'package:weathque/features/app/presentation/widgets/temperature/temperature.dart';
import 'package:weathque/features/app/presentation/widgets/weather_card/weather_card.dart';
import 'package:weathque/features/app/presentation/widgets/weekly_forecast/weekly_forecast.dart';



class Menu extends StatelessWidget {
  final WeatherEntity? weatherEntity;
  final ForecastWeatherEntity? forecastWeatherEntity;
  final String currentDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
  final Color color;
  late final String condition;
  late final String temperature;
  late final String summary;
  late final String windSpeed;
  late final String humidity;
  late final String visibility;

  Menu({
    required this.weatherEntity,
    required this.forecastWeatherEntity,
    required this.color,
    super.key
  }){
    condition = weatherEntity != null ?
      weatherEntity!.weather[0].main
      : "Not available";

    temperature = weatherEntity != null ?
      weatherEntity!.information.temp!.round().toString()
      : "0";

    summary = weatherEntity != null ?
      locator<SummaryBuilder>()(weatherEntity!)
      : "Not available";

    windSpeed = weatherEntity != null ?
      weatherEntity!.wind.speed.toString()
      : "Not available";

    humidity = weatherEntity != null ?
      weatherEntity!.information.humidity.toString()
      : "Not available";

    visibility = weatherEntity != null ?
      (weatherEntity!.visibility/1000).round().toString()
      : "Not available";
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 11,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Date(date: currentDate, color: color),
          Condition(condition: condition),
          Temperature(temperature: temperature),
          const Header(text: "Daily Summary"),
          Summary(text: summary),
          const SizedBox(height: 25),
          WeatherCard(
            humidity: humidity,
            visibility: visibility,
            windSpeed: windSpeed,
            color: color,
          ),
          const SizedBox(height: 25),
          const WeeklyForecastHeader(),
          WeeklyForecast(
            forecastWeatherEntity: forecastWeatherEntity,
          )
        ],
      ),
    );
  }
}