import 'package:flutter/material.dart';

class RightAnimation extends StatelessWidget {
  final Widget child;
  final bool animationField;
  final Duration duration;
  final Curve curve;
  final double positionInitialValue;
  final double opacityInitialValue;

  const RightAnimation({super.key, required this.child, required this.animationField, required this.duration, required this.curve, required this.positionInitialValue, required this.opacityInitialValue});

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
      ),
    );
  }
}