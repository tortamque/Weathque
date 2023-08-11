import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/texts/header.dart';

class WeeklyForecastHeader extends StatelessWidget {
  const WeeklyForecastHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Header(text: "Weekly forecast"),
        Image.asset("assets/icons/arrow.png", height: 17.5)
      ],
    );
  }
}