import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/animations/top_animation.dart';
import 'package:weathque/features/app/presentation/widgets/weather_card/weather_card_template.dart';

class WeatherCard extends StatefulWidget {
  final String windSpeed;
  final String humidity;
  final String visibility;

  const WeatherCard({
    super.key, 
    required this.windSpeed, 
    required this.humidity, 
    required this.visibility
  });

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  final Duration animationDuration = const Duration(milliseconds: 800);
  final Curve animationCurve = Curves.easeOutSine;
  bool isAnimated = false;
  
  @override
  void initState() {
    _startAnimation();
    super.initState();
  }

  void _startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 2000))
      .then((value) => setState(() => isAnimated = true));
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Stack(
        children: [
          TopAnimation(
            animationField: isAnimated, 
            duration: animationDuration, 
            curve: animationCurve, 
            positionInitialValue: MediaQuery.of(context).size.height/40, 
            opacityInitialValue: 0,
            child: WeatherCardTemplate(
              humidity: widget.humidity,
              visibility: widget.visibility,
              windSpeed: widget.windSpeed,
            ),
          )
        ],
      ),
    );
  }
}