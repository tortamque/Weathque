import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final Color color;

  const HeaderText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 18,
        color: color
      ),
    );
  }
}