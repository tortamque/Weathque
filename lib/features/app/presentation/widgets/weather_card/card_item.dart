import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';

class CardItem extends StatelessWidget {
  final String iconPath;
  final String data;
  final String type;

  const CardItem({
    required this.iconPath,
    required this.data,
    required this.type,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              iconPath, 
              height: 40, 
              width: 40, 
              color: CustomColors.yellow
            ),
            Text(
              data,
              style: const TextStyle(
                color: CustomColors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            Text(
              type,
              style: const TextStyle(
                color: CustomColors.yellow,
                fontSize: 12
              ),
            ),
          ],
        ),
      ),
    );
  }
}