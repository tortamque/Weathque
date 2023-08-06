import 'package:flutter/material.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/domain/entities/current_city_entity.dart';
import 'package:weathque/features/app/domain/entities/weather_entity.dart';
import 'package:weathque/features/app/presentation/widgets/appBar/appbar.dart';
import 'package:weathque/features/app/presentation/widgets/core/menu.dart';

class WeatherPage extends StatelessWidget {
  final WeatherEntity? weatherEntity;
  final String currentCity = locator<CurrentCity>().currentCity.string;

  WeatherPage({
    required this.weatherEntity,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: currentCity),
      body: Row(
      children: [
          const Spacer(flex: 1,),
          Menu(weatherEntity: weatherEntity,),
          const Spacer(flex: 1,),
        ],
      ),
    );
  }
}