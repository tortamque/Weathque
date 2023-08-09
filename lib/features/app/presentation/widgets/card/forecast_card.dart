import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';

class ForecastCard extends StatelessWidget {
  final String temperature;
  final String iconPath;
  final String date;

  const ForecastCard({
    required this.temperature,
    required this.iconPath,
    required this.date,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 3
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        height: 110,
        width: 67.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${temperature}°",
              style: const TextStyle(
                color: CustomColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            Image.asset(
              iconPath,
              width: 20,
              height: 20,
            ),
            Text(
              date,
              style: TextStyle(
                color: CustomColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12
              ),
            ),
          ],
        ),
      ),
    );
  }
}