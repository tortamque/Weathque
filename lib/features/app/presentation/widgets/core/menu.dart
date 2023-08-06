import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/domain/entities/summary_builder.dart';
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
  late final String summary;

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

    summary = weatherEntity != null ?
      locator<SummaryBuilder>()(weatherEntity!)
      : "Not available";
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
          SummaryText(text: summary),
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