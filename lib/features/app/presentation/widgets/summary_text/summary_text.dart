import 'package:flutter/material.dart';

class SummaryText extends StatelessWidget {
  final String text;
  final Color color;

  const SummaryText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color
      ),
    );
  }
}