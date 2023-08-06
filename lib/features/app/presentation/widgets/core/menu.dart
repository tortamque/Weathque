import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathque/features/app/domain/entities/weather_entity.dart';
import 'package:weathque/features/app/presentation/widgets/card/weather_card.dart';
import 'package:weathque/features/app/presentation/widgets/scrollable/weekly_forecast.dart';
import 'package:weathque/features/app/presentation/widgets/texts/condition.dart';
import 'package:weathque/features/app/presentation/widgets/texts/header.dart';
import 'package:weathque/features/app/presentation/widgets/texts/date.dart';
import 'package:weathque/features/app/presentation/widgets/texts/summary_text.dart';
import 'package:weathque/features/app/presentation/widgets/texts/temperature.dart';
import 'package:weathque/features/app/presentation/widgets/texts/weekly_forecast_header.dart';


class Menu extends StatelessWidget {
  final WeatherEntity? weatherEntity;
  final String currentDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
  late final String condition;
  late final String temperature;

  Menu({
    required this.weatherEntity,
    super.key
  }){
    condition = weatherEntity != null ?
      weatherEntity!.weather[0].main
      : "Not available";

    temperature = weatherEntity != null ?
      weatherEntity!.information.temp!.round().toString()
      : "0";
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 11,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Date(date: currentDate),
          Condition(condition: condition),
          Temperature(temperature: temperature),
          const Header(text: "Daily Summary"),
          const SummaryText(text: "Now it feels like +35\", actually +31.\nIt feels hot because of the direct sun. Today,\nthe temperature is felt in the range from +31\" to 27\"."),
          Spacer(flex: 3),
          const WeatherCard(),
          Spacer(flex: 3),
          const WeeklyForecastHeader(),
          WeeklyForecast()
        ],
      ),
    );
  }
}