import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/domain/usecases/delete_city.dart';

class CityCard extends StatelessWidget {
  final String name;

  const CityCard({super.key, required this.name});

  @override
  Widget build(BuildContext context)  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Dismissible(
        key: Key(name),
        onDismissed: (_) async {
          await locator<DeleteCityUseCaseImplementation>()(name);
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
      ),
    );
  }
}