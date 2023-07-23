import 'package:flutter/material.dart';

class DailySummary extends StatelessWidget {
  const DailySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 40),
      child: Text(
        "Daily Summary",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 18
        ),
      ),
    );
  }
}