import 'package:flutter/material.dart';

class SummaryText extends StatelessWidget {
  final String text;
  final double padding;

  const SummaryText({
    required this.text,
    required this.padding,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}