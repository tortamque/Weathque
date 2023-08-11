import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;

  const DateCard({
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: backgroundColor
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5 
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}