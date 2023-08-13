import 'package:flutter/material.dart';

class ArrowAnimation extends StatelessWidget {
  final Curve curve;
  final Duration duration;
  final bool animationField;
  final double positionInitialValue;
  final double opacityInitialValue;
  final Widget child;

  const ArrowAnimation({super.key, required this.curve, required this.duration, required this.animationField, required this.positionInitialValue, required this.opacityInitialValue, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      curve: curve,
      right: !animationField ? positionInitialValue : 0,
      child: AnimatedOpacity(
        duration: duration,
        curve: curve,
        opacity: !animationField ? opacityInitialValue : 1,
        child: child
      )
    );
  }
}