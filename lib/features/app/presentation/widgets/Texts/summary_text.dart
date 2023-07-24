import 'package:flutter/material.dart';

class SummaryText extends StatelessWidget {
  final String text;

  const SummaryText({
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}