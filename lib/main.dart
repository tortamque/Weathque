import 'package:flutter/material.dart';
import 'package:weathque/config/theme/app_themes.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/presentation/pages/paris.dart';
import 'package:weathque/features/app/presentation/widgets/appBar/appbar.dart';
import 'package:weathque/features/app/presentation/widgets/core/menu.dart';

void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: ParisPage()
    );
  }
}