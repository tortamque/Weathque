import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/features/app/presentation/widgets/animations/right_animation.dart';
import 'package:weathque/features/app/presentation/widgets/animations/top_animation.dart';
import 'package:weathque/features/app/presentation/widgets/temperature/temperature_text.dart';

class Temperature extends StatefulWidget {
  final String temperature;

  const Temperature({
  required this.temperature,
    super.key
  });

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  final Duration temperatureAnimationDuration = const Duration(milliseconds: 500);
  final Curve temperatureAnimationCurve = Curves.easeOutSine;
  final Duration degreeAnimationDuration = const Duration(milliseconds: 700);
  final Curve degreeAnimationCurve = Curves.easeOutCubic;
  bool isAnimatedTemperature = false;
  bool isAnimatedDegree = false;
  
  @override
  void initState() {
    _startAnimationTemperature();
    _startAnimationDegree();
    super.initState();
  }

  void _startAnimationTemperature() async{
    await Future.delayed(const Duration(milliseconds: 1000))
      .then((value) => setState(() => isAnimatedTemperature = true));
  }

  void _startAnimationDegree() async{
    await Future.delayed(const Duration(milliseconds: 1400))
      .then((value) => setState(() => isAnimatedDegree = true));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: FractionallySizedBox(
          heightFactor: 0.9,
          widthFactor: 0.9,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Row(
              children: [
                Stack(
                  children: [
                    TemperatureText(
                      text: "${widget.temperature}°", 
                      color: Colors.transparent
                    ),

                    TopAnimation(
                      animationField: isAnimatedTemperature, 
                      duration: temperatureAnimationDuration, 
                      curve: temperatureAnimationCurve, 
                      positionInitialValue: MediaQuery.of(context).size.height/500, 
                      opacityInitialValue: 0,
                      child: TemperatureText(
                          text: widget.temperature,
                          color: CustomColors.black,
                        ),
                    ),

                    RightAnimation(
                      animationField: isAnimatedDegree, 
                      duration: degreeAnimationDuration, 
                      curve: degreeAnimationCurve, 
                      positionInitialValue: MediaQuery.of(context).size.width/55, 
                      opacityInitialValue: 0,
                      child: const TemperatureText(
                        text: "°",
                        color: CustomColors.black,
                      ), 
                    )
                  ],
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}