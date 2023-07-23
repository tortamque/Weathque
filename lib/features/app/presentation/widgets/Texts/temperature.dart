import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  final String temperature;
  final Color textColor;

  const Temperature({
  required this.temperature,
    required this.textColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "${temperature}°",
      style: TextStyle(
        fontSize: 165,
        color: textColor,
        fontWeight: FontWeight.w400
      )
    );
  }
}