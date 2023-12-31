import 'package:flutter/material.dart';

class TemperatureAnimation extends StatelessWidget {
  final Widget child;
  final bool isAnimated;
  final Duration animationDuration;
  final Curve animationCurve;
  final double positionInitialValue;
  final double opacityInitialValue;

  const TemperatureAnimation({super.key, required this.child, required this.isAnimated, required this.animationDuration, required this.animationCurve, required this.positionInitialValue, required this.opacityInitialValue});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: animationDuration,
      curve: animationCurve,
      top: !isAnimated ? positionInitialValue : 0,
      child: AnimatedOpacity(
        duration: animationDuration,
        curve: animationCurve,
        opacity: !isAnimated ? opacityInitialValue : 1,
        child: child
      ),
    );
  }
}