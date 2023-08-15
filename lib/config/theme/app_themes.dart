import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: CustomColors.yellow.color,
    useMaterial3: true,
  );
}