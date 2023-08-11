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
    return Expanded(
      flex: 1,
      child: Center(
        child: FractionallySizedBox(
          heightFactor: 0.85,
          widthFactor: 0.85,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "${temperature}°",
              style: const TextStyle(
                color: CustomColors.black,
                fontWeight: FontWeight.w400
              )
            ),
          ),
        ),
      ),
    );
  }
}