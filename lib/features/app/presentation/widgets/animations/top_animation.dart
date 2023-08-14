import 'package:flutter/material.dart';

class TopAnimation extends StatelessWidget {
  final Widget child;
  final bool animationField;
  final Duration duration;
  final Curve curve;
  final double positionInitialValue;
  final double opacityInitialValue;

  const TopAnimation({super.key, required this.child, required this.animationField, required this.duration, required this.curve, required this.positionInitialValue, required this.opacityInitialValue});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      curve: curve,
      top: !animationField ? positionInitialValue : 0,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: duration,
        curve: curve,
        opacity: !animationField ? opacityInitialValue : 1,
        child: child,
      ),
    );
  }
}