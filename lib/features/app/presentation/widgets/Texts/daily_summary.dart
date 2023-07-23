import 'package:flutter/material.dart';

class DailySummary extends StatelessWidget {
  final double padding;

  const DailySummary({required this.padding, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: const Text(
        "Daily Summary",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 18
        ),
      ),
    );
  }
}