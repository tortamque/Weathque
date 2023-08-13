import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/features/app/presentation/widgets/misc/headers/forecast_header/arrow_animation.dart';
import 'package:weathque/features/app/presentation/widgets/misc/headers/forecast_header/weekly_forecast_animation.dart';
import 'package:weathque/features/app/presentation/widgets/misc/headers/summary_header/header_text.dart';
 
class WeeklyForecastHeader extends StatefulWidget {
  const WeeklyForecastHeader({super.key});

  @override
  State<WeeklyForecastHeader> createState() => _WeeklyForecastHeaderState();
}

class _WeeklyForecastHeaderState extends State<WeeklyForecastHeader> {
  final Duration animationDurationText = const Duration(milliseconds: 500);
  final Duration animationDurationArrow = const Duration(milliseconds: 1000);
  final Curve animationCurve = Curves.easeOutSine;
  bool isAnimatedWeekly = false;
  bool isAnimatedForecast = false;
  bool isAnimatedArrow = false;
  
  @override
  void initState() {
    _startAnimationWeekly();
    _startAnimationForecast();
    _startAnimationArrow();
    super.initState();
  }

  void _startAnimationWeekly() async{
    await Future.delayed(const Duration(milliseconds: 2200))
      .then((value) => setState(() => isAnimatedWeekly = true));
  }

  void _startAnimationForecast() async{
  await Future.delayed(const Duration(milliseconds: 2400))
    .then((value) => setState(() => isAnimatedForecast = true));
  }

  void _startAnimationArrow() async{
  await Future.delayed(const Duration(milliseconds: 2500))
    .then((value) => setState(() => isAnimatedArrow = true));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,  
      children: [
        Row(
          children: [
            Stack(
              children: [
                const HeaderText(text: "Weekly", color: Colors.transparent),
                WeeklyForecastAnimation(
                  curve: animationCurve, 
                  duration: animationDurationText, 
                  animationField: isAnimatedWeekly, 
                  positionInitialValue: 20, 
                  opacityInitialValue: 0, 
                  child: const HeaderText(text: "Weekly", color: CustomColors.black)
                )
              ],
            ),

            Stack(
              children: [
                const HeaderText(text: " forecast", color: Colors.transparent),
                WeeklyForecastAnimation(
                  curve: animationCurve, 
                  duration: animationDurationText, 
                  animationField: isAnimatedForecast, 
                  positionInitialValue: 20, 
                  opacityInitialValue: 0, 
                  child: const HeaderText(text: " forecast", color: CustomColors.black),
                )
              ],
            ),
          ]
        ),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            const SizedBox(
              height: 17.5,
              width: double.infinity,
            ),

            ArrowAnimation(
              curve: animationCurve, 
              duration: animationDurationArrow, 
              animationField: isAnimatedArrow, 
              positionInitialValue: 100, 
              opacityInitialValue: 0, 
              child: Image.asset("assets/icons/arrow.png", height: 17.5),
            )
          ],
        )
      ],
    );
  }
}