import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';

class CityCard extends StatelessWidget {
  final String name;

  const CityCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(name),
      onDismissed: (direction) {
        //print("$name deleted");
        print(direction);
      },
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 24,
              ),
            )
          )
        ),
      ),
    );
  }
}