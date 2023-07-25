import 'package:flutter/material.dart';

class SummaryText extends StatelessWidget {
  final String text;

  const SummaryText({
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13
          ),
        ),
      ),
    );
  }
}