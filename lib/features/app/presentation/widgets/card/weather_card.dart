import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/card/card_item.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.black
        ),
        width: double.infinity,
        height: 125,
        child: Row(
          children: [
            CardItem(
              iconPath: "assets/icons/wind.png",
              data: "4km/h", 
              type: "Wind"
            ),
            CardItem(
              iconPath: "assets/icons/drop.png",
              data: "48%", 
              type: "Humidity"
            ),
            CardItem(
              iconPath: "assets/icons/eye.png",
              data: "1.6km", 
              type: "Visibility"
            ),
          ],
        ),
      ),
    );
  }
}