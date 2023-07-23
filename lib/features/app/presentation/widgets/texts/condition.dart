import 'package:flutter/material.dart';

class Condition extends StatelessWidget {
  final String condition;
  final Color textColor;

  const Condition({
    required this.condition,
    required this.textColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        condition,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
      ),
    );
  }
}