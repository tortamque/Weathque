import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';

class Temperature extends StatelessWidget {
  final String temperature;

  const Temperature({
  required this.temperature,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "${temperature}°",
      style: const TextStyle(
        fontSize: 165,
        color: CustomColors.black,
        fontWeight: FontWeight.w400
      )
    );
  }
}