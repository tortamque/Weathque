import 'package:flutter/material.dart';

class ForecastCardAnimation extends StatelessWidget {
  final Curve curve;
  final Duration duration;
  final bool animationField;
  final double positionInitialValue;
  final double opacityInitialValue;
  final Widget child;

  const ForecastCardAnimation({super.key, required this.curve, required this.duration, required this.animationField, required this.positionInitialValue, required this.opacityInitialValue, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: duration,
        curve: curve,
        top: !animationField ? positionInitialValue : 0,
        child: AnimatedOpacity(
          duration: duration,
          curve: curve,
          opacity: !animationField ? opacityInitialValue : 1,
          child: child,
      )
    );
  }
}