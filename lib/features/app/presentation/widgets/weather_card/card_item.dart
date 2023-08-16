import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String iconPath;
  final String data;
  final String type;
  final Color color;

  const CardItem({
    required this.iconPath,
    required this.data,
    required this.type,
    required this.color,
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
              color: color
            ),
            Text(
              data,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            Text(
              type,
              style: TextStyle(
                color: color,
                fontSize: 12
              ),
            ),
          ],
        ),
      ),
    );
  }
}