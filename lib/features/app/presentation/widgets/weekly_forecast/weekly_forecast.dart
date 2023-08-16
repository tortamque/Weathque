import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathque/features/app/domain/entities/forecast_weather_entity.dart';
import 'package:weathque/features/app/presentation/widgets/animations/top_animation.dart';
import 'package:weathque/features/app/presentation/widgets/misc/headers/summary_header/header.dart';
import 'package:weathque/features/app/presentation/widgets/weekly_forecast/forecast_card.dart';

class WeeklyForecast extends StatefulWidget {
  final ForecastWeatherEntity? forecastWeatherEntity;

  const WeeklyForecast({
    required this.forecastWeatherEntity,
    super.key
  });

  @override
  State<WeeklyForecast> createState() => _WeeklyForecastState();
}

class _WeeklyForecastState extends State<WeeklyForecast> {
  final DateTime currentDate = DateTime.now();

  final Duration animationDuration = const Duration(milliseconds: 500);
  final Curve animationCurve = Curves.easeOutSine;
  bool isAnimated1 = false;
  bool isAnimated2 = false;
  bool isAnimated3 = false;
  bool isAnimated4 = false;
  bool isAnimated5 = false;

  @override
  void initState() {
    _startAnimation1();
    _startAnimation2();
    _startAnimation3();
    _startAnimation4();
    _startAnimation5();
    super.initState();
  }

  void _startAnimation1() async{
    await Future.delayed(const Duration(milliseconds: 2700))
      .then((value) => setState(() => isAnimated1 = true));
  }

  void _startAnimation2() async{
    await Future.delayed(const Duration(milliseconds: 2850))
      .then((value) => setState(() => isAnimated2 = true));
  }

  void _startAnimation3() async{
    await Future.delayed(const Duration(milliseconds: 3000))
      .then((value) => setState(() => isAnimated3 = true));
  }

  void _startAnimation4() async{
    await Future.delayed(const Duration(milliseconds: 3150))
      .then((value) => setState(() => isAnimated4 = true));
  }

  void _startAnimation5() async{
    await Future.delayed(const Duration(milliseconds: 3300))
      .then((value) => setState(() => isAnimated5 = true));
  }

  @override
  Widget build(BuildContext context) {
    return widget.forecastWeatherEntity != null ?
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const SizedBox(
                  height: 110,
                  width: 67.5,
                ),
          
                TopAnimation(
                  curve: animationCurve, 
                  duration: animationDuration, 
                  animationField: isAnimated1, 
                  positionInitialValue: MediaQuery.of(context).size.height/26, 
                  opacityInitialValue: 0, 
                  child: ForecastCard(
                    temperature: widget.forecastWeatherEntity!.list[8 * 0 + 0].main.temp.round().toString(),
                    iconPath: defineIcon(widget.forecastWeatherEntity!.list[8 * 0 + 6].weather[0].id),
                    date: DateFormat('dd MMM').format(DateTime(currentDate.year, currentDate.month, currentDate.day + 1))
                  )
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                const SizedBox(
                  height: 110,
                  width: 67.5,
                ),

                TopAnimation(
                  curve: animationCurve, 
                  duration: animationDuration, 
                  animationField: isAnimated2, 
                  positionInitialValue: MediaQuery.of(context).size.height/26, 
                  opacityInitialValue: 0, 
                  child: ForecastCard(
                    temperature: widget.forecastWeatherEntity!.list[8 * 1 + 6].main.temp.round().toString(),
                    iconPath: defineIcon(widget.forecastWeatherEntity!.list[8 * 1 + 6].weather[0].id),
                    date: DateFormat('dd MMM').format(DateTime(currentDate.year, currentDate.month, currentDate.day + 2))
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                const SizedBox(
                  height: 110,
                  width: 67.5,
                ),

                TopAnimation(
                  curve: animationCurve, 
                  duration: animationDuration, 
                  animationField: isAnimated3, 
                  positionInitialValue: MediaQuery.of(context).size.height/26, 
                  opacityInitialValue: 0,
                  child: ForecastCard(
                    temperature: widget.forecastWeatherEntity!.list[8 * 2 + 6].main.temp.round().toString(),
                    iconPath: defineIcon(widget.forecastWeatherEntity!.list[8 * 2 + 6].weather[0].id),
                    date: DateFormat('dd MMM').format(DateTime(currentDate.year, currentDate.month, currentDate.day + 3))
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                const SizedBox(
                  height: 110,
                  width: 67.5,
                ),

                TopAnimation(
                  curve: animationCurve, 
                  duration: animationDuration, 
                  animationField: isAnimated4, 
                  positionInitialValue: MediaQuery.of(context).size.height/26, 
                  opacityInitialValue: 0,
                  child: ForecastCard(
                    temperature: widget.forecastWeatherEntity!.list[8 * 3 + 6].main.temp.round().toString(),
                    iconPath: defineIcon(widget.forecastWeatherEntity!.list[8 * 3 + 6].weather[0].id),
                    date: DateFormat('dd MMM').format(DateTime(currentDate.year, currentDate.month, currentDate.day + 4))
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                const SizedBox(
                  height: 110,
                  width: 67.5,
                ),

                TopAnimation(
                  curve: animationCurve, 
                  duration: animationDuration, 
                  animationField: isAnimated5, 
                  positionInitialValue: MediaQuery.of(context).size.height/26, 
                  opacityInitialValue: 0,
                  child: ForecastCard(
                    temperature: widget.forecastWeatherEntity!.list[8 * 4 + 6].main.temp.round().toString(),
                    iconPath: defineIcon(widget.forecastWeatherEntity!.list[8 * 4 + 6].weather[0].id),
                    date: DateFormat('dd MMM').format(DateTime(currentDate.year, currentDate.month, currentDate.day + 5))
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
    : Center(
      child: TopAnimation(
        curve: animationCurve, 
        duration: animationDuration, 
        animationField: isAnimated5, 
        positionInitialValue: MediaQuery.of(context).size.height/26, 
        opacityInitialValue: 0,
        child: const Header(text: "Weekly forecast data isn't available")
      ),
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