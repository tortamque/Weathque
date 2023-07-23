import 'package:flutter/material.dart';

class SummaryText extends StatelessWidget {
  final String text;

  const SummaryText({
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}