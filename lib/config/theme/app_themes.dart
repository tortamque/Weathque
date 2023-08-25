import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    useMaterial3: true,
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: Colors.black
    )
  );
}