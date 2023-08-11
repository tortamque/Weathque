import 'package:flutter/material.dart';

class SummaryText extends StatelessWidget {
  final String text;

  const SummaryText({
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}