import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/texts/condition.dart';
import 'package:weathque/features/app/presentation/widgets/texts/daily_summary.dart';
import 'package:weathque/features/app/presentation/widgets/texts/date.dart';
import 'package:weathque/features/app/presentation/widgets/texts/summary_text.dart';
import 'package:weathque/features/app/presentation/widgets/texts/temperature.dart';


class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 11,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Date(date: "Friday, 20 January"),
          const Condition(condition: "Sunny"),
          const Temperature(temperature: "31"),
          const DailySummary(),
          const SummaryText(text: "Now it feels like +35\", actually +31.\nIt feels hot because of the direct sun. Today,\nthe temperature is felt in the range from +31\" to 27\"."),
        ],
      ),
    );
  }
}