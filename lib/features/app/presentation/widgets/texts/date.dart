import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';

class Date extends StatelessWidget {
  final String date;
  final Color textColor;

  const Date({
    required this.date, 
    required this.textColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: CustomColors.black
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5 
        ),
        child: Text(
          date,
          style: const TextStyle(
            color: CustomColors.yellow,
          ),
        ),
      ),
    );
  }
}