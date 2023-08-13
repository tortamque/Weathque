import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/weather_card/card_item.dart';

class WeatherCardTemplate extends StatelessWidget {
  final String windSpeed;
  final String humidity;
  final String visibility;
  
  const WeatherCardTemplate({super.key, required this.windSpeed, required this.humidity, required this.visibility});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black
      ),
      height: 125,
      width: double.maxFinite,
      child: Row(
        children: [
          CardItem(
            iconPath: "assets/icons/wind.png",
            data: "${windSpeed}km/h", 
            type: "Wind"
          ),
          CardItem(
            iconPath: "assets/icons/drop.png",
            data: "${humidity}%", 
            type: "Humidity"
          ),
          CardItem(
            iconPath: "assets/icons/eye.png",
            data: "${visibility}km", 
            type: "Visibility"
          ),
        ],
      ),
    );
  }
}