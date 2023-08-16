import 'package:flutter/material.dart';

enum CustomColors{
  yellow(Color(0xFFFFE142)),
  blue(Color(0xFF42C6FF)),
  pink(Color(0xFFFF64D4));

  final Color color;

  const CustomColors(this.color);
}