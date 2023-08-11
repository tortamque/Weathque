import 'package:flutter/material.dart';

class DateAnimation extends StatelessWidget {
  final Widget child;
  final Curve curve;
  final Duration duration;
  final bool animationField;
  final double positionInitialValue;
  final double opacityInitialValue;

  const DateAnimation({
    required this.child,
    required this.curve,
    required this.duration,
    required this.animationField,
    required this.positionInitialValue,
    required this.opacityInitialValue,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      curve: curve,
      duration: duration,
      top: !animationField ? positionInitialValue : 0,
      child: AnimatedOpacity(
        curve: curve,
        duration: duration,
        opacity: !animationField ? opacityInitialValue : 1,
        child: child
      ),
    );
  }
}