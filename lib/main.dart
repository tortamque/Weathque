import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/features/app/presentation/widgets/appBar/appbar.dart';
import 'package:weathque/features/app/presentation/widgets/texts/condition.dart';
import 'package:weathque/features/app/presentation/widgets/texts/date.dart';
import 'package:weathque/features/app/presentation/widgets/texts/temperature.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weathque',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weathque'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.yellow,
      appBar: CustomAppBar(title: widget.title),
      body: Center(
        child: Column(
          children: [
            //Spacer here
            const Date(date: "Friday, 20 January", textColor: CustomColors.yellow,),
            const Condition(condition: "Sunny", textColor: CustomColors.black),
            const Temperature(temperature: "31", textColor: CustomColors.black)
          ],
        ),
      )
    );
  }
}
