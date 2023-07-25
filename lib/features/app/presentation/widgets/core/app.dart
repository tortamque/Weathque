import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/core/menu.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 1,),
        Menu(),
        const Spacer(flex: 1,),
      ],
    );
  }
}