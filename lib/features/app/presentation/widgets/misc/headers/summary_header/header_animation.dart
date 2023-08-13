import 'package:flutter/material.dart';

class HeaderAnimation extends StatelessWidget {
  final Widget child;
  final Curve curve;
  final Duration duration;
  final bool animationField;
  final double positionInitialValue;
  final double opacityInitialValue;

  const HeaderAnimation({super.key, required this.child, required this.curve, required this.duration, required this.animationField, required this.positionInitialValue, required this.opacityInitialValue});

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
        child: child
      ),
    );
  }
}