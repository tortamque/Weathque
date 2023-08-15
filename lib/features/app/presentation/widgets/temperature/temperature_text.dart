import 'package:flutter/material.dart';

class TemperatureText extends StatelessWidget {
  final String text;
  final Color color;

  const TemperatureText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400
      )
    );
  }
}