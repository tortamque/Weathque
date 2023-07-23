import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';

class Condition extends StatelessWidget {
  final String condition;

  const Condition({
    required this.condition,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        condition,
        style: const TextStyle(
          color: CustomColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
      ),
    );
  }
}