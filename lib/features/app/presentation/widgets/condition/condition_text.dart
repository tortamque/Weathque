import 'package:flutter/material.dart';

class ConditionText extends StatelessWidget {
  final String text;
  final Color color;

  const ConditionText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 16
      ),
    );
  }
}