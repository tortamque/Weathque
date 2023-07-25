import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/card/weather_card.dart';
import 'package:weathque/features/app/presentation/widgets/scrollable/weekly_forecast.dart';
import 'package:weathque/features/app/presentation/widgets/texts/condition.dart';
import 'package:weathque/features/app/presentation/widgets/texts/header.dart';
import 'package:weathque/features/app/presentation/widgets/texts/date.dart';
import 'package:weathque/features/app/presentation/widgets/texts/summary_text.dart';
import 'package:weathque/features/app/presentation/widgets/texts/temperature.dart';
import 'package:weathque/features/app/presentation/widgets/texts/weekly_forecast_header.dart';


class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 11,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Date(date: "Friday, 20 January"),
          const Condition(condition: "Sunny"),
          const Temperature(temperature: "31"),
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