import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/card/card_item.dart';

class WeatherCard extends StatelessWidget {
  final String windSpeed;
  final String humidity;
  final String visibility;

  const WeatherCard({
    super.key, 
    required this.windSpeed, 
    required this.humidity, 
    required this.visibility
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black
      ),
      height: 125,
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