import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathque/features/app/domain/entities/forecast_weather_entity.dart';
import 'package:weathque/features/app/presentation/widgets/weekly_forecast/forecast_card.dart';
import 'package:weathque/features/app/presentation/widgets/texts/header.dart';

class WeeklyForecast extends StatelessWidget {
  final ForecastWeatherEntity? forecastWeatherEntity;
  final DateTime currentDate = DateTime.now();

  WeeklyForecast({
    required this.forecastWeatherEntity,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return forecastWeatherEntity != null ?
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ForecastCard(
            temperature: forecastWeatherEntity!.list[8 * 0 + 5].main.temp.round().toString(),
            iconPath: defineIcon(forecastWeatherEntity!.list[8 * 0 + 5].weather[0].id),
            date: DateFormat('dd MMM').format(DateTime(currentDate.year, currentDate.month, currentDate.day + 1))
          ),
          ForecastCard(
            temperature: forecastWeatherEntity!.list[8 * 1 + 5].main.temp.round().toString(),
            iconPath: defineIcon(forecastWeatherEntity!.list[8 * 1 + 5].weather[0].id),
            date: DateFormat('dd MMM').format(DateTime(currentDate.year, currentDate.month, currentDate.day + 2))
          ),
          ForecastCard(
            temperature: forecastWeatherEntity!.list[8 * 2 + 5].main.temp.round().toString(),
            iconPath: defineIcon(forecastWeatherEntity!.list[8 * 2 + 5].weather[0].id),
            date: DateFormat('dd MMM').format(DateTime(currentDate.year, currentDate.month, currentDate.day + 3))
          ),
          ForecastCard(
            temperature: forecastWeatherEntity!.list[8 * 3 + 5].main.temp.round().toString(),
            iconPath: defineIcon(forecastWeatherEntity!.list[8 * 3 + 5].weather[0].id),
            date: DateFormat('dd MMM').format(DateTime(currentDate.year, currentDate.month, currentDate.day + 4))
          ),
          ForecastCard(
            temperature: forecastWeatherEntity!.list[8 * 4 + 5].main.temp.round().toString(),
            iconPath: defineIcon(forecastWeatherEntity!.list[8 * 4 + 5].weather[0].id),
            date: DateFormat('dd MMM').format(DateTime(currentDate.year, currentDate.month, currentDate.day + 5))
          ),
        ],
      ),
    )
    : const Center(
      child: Header(text: "Weekly forecast data isn't available"),
    );
  }

  String defineIcon(int id){
    switch(id){
      case >= 200 && < 300:
        return "assets/icons/weather/lightning.png";
      case >= 300 && < 400:
        return "assets/icons/weather/rain.png";
      case >= 500 && < 600:
        return "assets/icons/weather/rain.png";
      case >= 600 && < 700:
        return "assets/icons/weather/snow.png";
      case >= 700 && < 800:
        return "assets/icons/weather/mist.png";
      case 800:
        return "assets/icons/weather/sun.png";
      case >800 && < 803:
        return "assets/icons/weather/partly-cloudy.png";
      case >= 803:
        return "assets/icons/weather/cloud.png"; 
      default:
        return "assets/icons/weather/unknown.png";
    }
  }
}