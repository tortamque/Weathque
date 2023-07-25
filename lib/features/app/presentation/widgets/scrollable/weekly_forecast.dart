import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/card/forecast_card.dart';

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 16,
      child: SizedBox(
        height: 100,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ForecastCard(
                temperature: "26",
                iconPath: "assets/icons/weather/cloud.png",
                date: "21 Jan"
              ),
              ForecastCard(
                temperature: "21",
                iconPath: "assets/icons/weather/lightning.png",
                date: "22 Jan"
              ),
              ForecastCard(
                temperature: "22",
                iconPath: "assets/icons/weather/partly-cloudy.png",
                date: "23 Jan"
              ),
              ForecastCard(
                temperature: "25",
                iconPath: "assets/icons/weather/rain.png",
                date: "24 Jan"
              ),
              ForecastCard(
                temperature: "28",
                iconPath: "assets/icons/weather/storm.png",
                date: "25 Jan"
              ),
            ],
          ),
        ),
      ),
    );
  }
}